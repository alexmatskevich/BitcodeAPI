# CryptApi

The gem sending an encrypted request to the specified address and decrypting of the received response. Demo-version 0.1.9. 

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

After installation CryptApi, you need to run the generator:
    
    $ rails g initializer crypt_api

The generator will create a file config/intializers/crypt_api.rb to set up the necessary configs.


Now you can send encrypted data call the following method:

  ```ruby
    secret_data = { secret_param_1: "param1", secret_param_2: "param2" }
    encrypted_response = CryptApi::Main.send_encrypted_request(data: secret_data)
  ```

And also receive and decrypt the response:

  ```ruby
    params = {data: "encrypted_data",...}
    CryptApi::Main.decrypt_response(params[:data]) # => {:data=>{:secret_param_1=>"param1", :secret_param_2=>"param2"}}
  ```


## Contributing

1. Fork it ( https://github.com/alexmatskevich/crypt-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
