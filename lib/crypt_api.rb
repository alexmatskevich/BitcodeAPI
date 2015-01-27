require "crypt_api/version"
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

    class << self
      attr_accessor :secret_key, :encrypt_algorithm, :make_signature, :url, :signature_token
    end

    def self.set_configs
      yield(self) 
    end

    def self.send_encrypted_request(data)
      encryptor = ApiCrypt::EncryptFactory.new
      sender    = ApiCrypt::Sender.new
      encrypted_data = encryptor.encrypt_data(data.to_s, self.secret_key)
      sender.post_data({data: encrypted_data}, self.url)
    end

    def self.decrypt_response(encrypted_response)
      decryptor = ApiCrypt::EncryptFactory.new
      decryptor.decrypt_data(encrypted_response, self.secret_key)
    end


  end


end
