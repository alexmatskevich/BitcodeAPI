CryptApi::Main.set_configs do |config|
  
  # secret_key for encrypting data
  config.secret_key = "YOUR_SECRET_KEY"

  # algorithm for encrypting data
  config.encrypt_algorithm = "AES-256-CBC"

  # if you need signature for each request 
  config.make_signature = false 

  # if config.make_signature = true
  # you need uncomment next line 
  # config.signature_token = "YOUR_SIGNATURE_TOKEN"

  config.url = "http://your_url_here"

end