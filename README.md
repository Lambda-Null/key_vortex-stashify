# KeyVortex::Stashify

This is an implementation of an adapter for [KeyVortex](https://github.com/lambda-Null/key-vortex/) allowing use of any file storage provider via [Stashify](https://github.com/Lambda-Null/stashify).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'key_vortex-stashify'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install key_vortex-stashify

## Usage

```ruby
require "key_vortex/adapter/stashify"
require "stashify/directory/local"
require "key_vortex/record"

class ExampleRecord < KeyVortex::Record
  field :a, String, length: 100
end

> vortex = KeyVortex.vortex(:stashify, ExampleRecord, stashify: Stashify::Directory::Local.new(path: "/tmp/demo"))
=>
#<KeyVortex:0x0000557c90244b88
> vortex.save(ExampleRecord.new(key: "foo", a: "bar"))
> vortex.find("foo")
=> #<ExampleRecord:0x0000557c90ff5868 @values={:key=>"foo", :a=>"bar"}>
> vortex.remove("foo")
> vortex.find("foo")
=> nil
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/key_vortex-stashify. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/key_vortex-stashify/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the KeyVortex::Stashify project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/key_vortex-stashify/blob/main/CODE_OF_CONDUCT.md).
