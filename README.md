# Squeezectrl

CLI for mysqueezebox.com remote control feature

## Installation & Usage

Requirements:

* PhantomJS needs to be installed on your system - see [README of poltergeist gem](https://github.com/teampoltergeist/poltergeist#installing-phantomjs)
* The language of your mysqueezebox.com account needs to be set to English in order to get this to work.

1. Install via rubygems:

```
user@host:~> gem install squeezectrl
```

2. Create a config file:

```
user@host:~> cat ~/.config/squeezectrl.yml
email: "your-email-address@example.com"
password: "your-password"
user@host:~>
```

3. Use provided CLI

```
user@host:~> squeezectrl
Commands:
  squeezectrl help [COMMAND]  # Describe available commands or one specific command
  squeezectrl pause           # Pause playback
  squeezectrl play            # Start playback
  squeezectrl power           # Turn On/Off your squeezebox player
user@host:~> squeezectrl power
user@host:~> squeezectrl play
user@host:~> squeezectrl pause
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/klausmeyer/squeezectrl.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

