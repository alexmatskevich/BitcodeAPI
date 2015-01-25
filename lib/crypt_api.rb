# require "crypt_api/version"
require "net/http"
require 'base64'
require 'openssl'
require 'digest/md5'

require_relative 'encrypt_factory.rb'
require_relative 'sender.rb'


module CryptApi

  class Main

    include EncryptFactory
    include Sender

    def self.config
      #TODO =>
      # config = Configuration.new
      # yield(config) 
    end

    def self.send_encrypted_request(data)
      encrypted_data = encrypt_data(data.to_s, SECRET_KEY)
      post_data({data: encrypted_data}, URL)
    end

    def self.decrypt_response(encrypted_response)
      decrypt_data(encrypted_data, SECRET_KEY)
    end

  end


end
