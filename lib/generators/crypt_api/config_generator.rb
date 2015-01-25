module CryptApi
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates a CryptApi initializer"
      
      class_option :orm

      def copy_initializer
        template "crypt_api.rb", "config/initializers/crypt_api.rb"
      end

    end
  end
end