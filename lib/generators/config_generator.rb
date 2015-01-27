module Generators
  class ConfigGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    desc "Creates a CryptApi initializer"
 
    def copy_initializer_file
      copy_file "crypt_api_initializer.rb", "config/initializers/#{file_name}.rb"
    end
  end
end
