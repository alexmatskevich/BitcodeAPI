# BitcodeApi

The gem sending an encrypted request to the specified address and decrypting of the received response. Demo-version 0.0.1.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitcode_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitcode_api

## Usage

```ruby
include BitcodeApi
```

```ruby
BitcodeApi::Main.new.send_encrypted_request(YOUR_URL_HERE , data: {param_1: "param1", param_2: "param2" })
```

## Contributing

1. Fork it ( https://github.com/alexmatskevich/bitcode_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
