# Uptimerobot::Ruby

A ruby wrapper for Uptime Robot

## Installation

Add this line to your application's Gemfile:

    gem 'uptimerobot-ruby', :git => git@github.com:by2-be/uptimerobot-ruby.git

And then execute:

    $ bundle

## Usage

```ruby
UptimeRobot::Client.api_key = "YOUR_API_KEY"
m = UptimeRobot::Monitor.create(
  :name => "test",
  :url => "www.test.com"
)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
