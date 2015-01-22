# CryptApi

The gem sending an encrypted request to the specified address and decrypting of the received response. Demo-version 0.0.1.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crypt-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crypt-api

## Usage

```ruby
include CryptApi
```

Sending the encrypted data:

  ```ruby
  secret_data = { secret_param_1: "param1", secret_param_2: "param2" }
  encrypted_response = CryptApi::Main.send_encrypted_request(YOUR_URL_HERE , data: secret_data, YOUR_KEY)
  ```

Decrypting of the response:

  ```ruby
   CryptApi::Main.decrypt_response(encrypted_response, YOUR_KEY)
  ```


## Contributing

1. Fork it ( https://github.com/alexmatskevich/crypt-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
