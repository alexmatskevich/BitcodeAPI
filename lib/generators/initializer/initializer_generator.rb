class InitializerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializer_file
    copy_file "crypt_api_initializer.rb", "config/initializers/#{file_name}.rb"
  end

end

