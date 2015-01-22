require "crypt_api/version"
require "net/http"
require 'base64'
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

    def encrypt(data, key)
      cipher = OpenSSL::Cipher::AES.new(128, :CBC)
      cipher.encrypt
      cipher.key = key

      code = cipher.update(data) + cipher.final

      base64_encode( code )
    end

    def decrypt( encrypted_data, key )
      code = base64_decode( encrypted_data )

      decipher = OpenSSL::Cipher::AES.new(128, :CBC)
      decipher.decrypt
      decipher.key = key

      decipher.update(decode) + decipher.final
    end

    private

    def base64_encode(code)
      Base64.encode64(code)
    end

    def base64_decode(encrypted_data)
      Base64.decode64(encrypted_data)
    end


  end


  class Main

    def self.send_encrypted_request(url ,data, secret_key)
      encryptor = EncryptFactory.new
      encrypted_data = encryptor.encrypt(data.to_s, secret_key)
      Sender.new(url).post_data(data: encrypted_data)
    end

    def self.decrypt_response(encrypted_response, secret_key)
      decryptor = EncryptFactory.new
      decryptor.decrypt(encrypted_data, secret_key)
    end

  end


end
