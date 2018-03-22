require "capybara"
require "capybara/dsl"
require "capybara/poltergeist"
require "ostruct"
require "thor"
require "yaml"

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

Capybara.default_driver    = :poltergeist
Capybara.run_server        = false
Capybara.app_host          = "http://mysqueezebox.com"

module Squeezectrl
  class Cli < Thor
    include Capybara::DSL

    desc "power", "Turn On/Off your squeezebox player"
    def power
      perform_action "power"
    end

    desc "pause", "Pause playback"
    def pause
      perform_action "pause"
    end

    desc "play", "Start playback"
    def play
      perform_action "play"
    end

    desc "version", "Show version of this tool"
    def version
      puts "#{$PROGRAM_NAME} version #{Squeezectrl::VERSION}"
    end

    private

    def perform_action(button)
      login
      open_remote_control
      find(".btn-#{button} button").click
    end

    def login
      visit "/index/Home"
      click_link "Log in"
      fill_in "email",    with: config.email
      fill_in "password", with: config.password
      click_button "Log in"
      page.has_content?("Log out") or raise "Login was not successful!"
    end

    def open_remote_control
      visit "/player/playerControl"
      page.has_content?("Current player") or raise "Remote control not possible"
    end

    def config
      @config ||= OpenStruct.new(YAML.load_file(config_file))
    end

    def config_file
      %w(~/.squeezectrl.yml ~/.config/squeezectrl.yml).each do |path|
        full_path = File.expand_path(path)
        return full_path if File.exists?(full_path)
      end

      raise "No config file found!"
    end
  end
end

