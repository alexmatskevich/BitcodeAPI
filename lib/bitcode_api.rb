require "bitcode_api/version"
require "net/http"
require 'openssl'


module CryptApi

  class Sender
    
    def initialize(url)
      @url = url
    end

    def post_data(data)
      uri = URI(@url)
      response = Net::HTTP.post_form(uri, data)
      response.body
    end

  end

  class EncryptFactory

    def encrypt(data)
      cipher = OpenSSL::Cipher::AES.new(128, :CBC)
      cipher.encrypt
      key = cipher.random_key
      iv = cipher.random_iv

      cipher.update(data) + cipher.final
    end

    def decrypt
      decipher = OpenSSL::Cipher::AES.new(128, :CBC)
      decipher.decrypt
      decipher.key = key
      decipher.iv = iv

      decipher.update(encrypted) + decipher.final
    end

  end


  class Main
    def self.send_encrypted_request(url ,data)
      encrypted_data = EncryptFactory.new.encrypt(data.to_s)
      Sender.new(url).post_data(data: encrypted_data)
    end
  end


end
