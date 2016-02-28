require_relative 'enigmahelpers'
class Decryption
  include EnigmaHelpers
  # attr_accessor :count
  def initialize(key, offset_key)
    @count = 0
    @key = key
    @offset_key = offset_key
    @text = ''
  end

  def decrypt(string)
    string.each_byte do |each_char|
      @text << decrypt_different(each_char)
      @count += 1
    end
    @text
  end

def decrypt_different(each_char)
  case each_char
  when 32..47 then decrypt_symbols(each_char)
  when 48..57 then decrypt_numbers(each_char)
  when 97..122 then decrypt_alphabets(each_char)
  end
end

def decrypt_alphabets(each_char)
  ((((each_char - 97) - get_total_rotation) % 26) + 97).chr
end

def decrypt_numbers(each_char)
  ((((each_char - 48) - get_total_rotation) % 10) + 48).chr
end

def decrypt_symbols(each_char)
  ((((each_char - 32) - get_total_rotation) % 16) + 32).chr
end

def get_total_rotation
  total_rotation(@count, @key, offset_key(date_of_encryption))
end

  # End of class
end
