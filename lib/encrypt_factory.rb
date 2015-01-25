module EncryptFactory
  
  def encrypt_data(data, key)
    cipher = OpenSSL::Cipher::AES.new(128, :CBC)
    cipher.encrypt
    cipher.key = key

    code = cipher.update(data) + cipher.final

    base64_encode( code )
  end

  def decrypt_data( encrypted_data, key )
    code = base64_decode( encrypted_data )

    decipher = OpenSSL::Cipher::AES.new(128, :CBC)
    decipher.decrypt
    decipher.key = key

    decipher.update(decode) + decipher.final
  end

  def make_signature( data, token)
    Digest::MD5.hexdigest( data.values.map(&:to_s).sort.inject(:+) + token )
  end

  private

  def base64_encode(code)
    Base64.encode64(code)
  end

  def base64_decode(encrypted_data)
    Base64.decode64(encrypted_data)
  end


  end