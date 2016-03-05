require "pry"
require "enigma"
class Decryption
  include EnigmaHelpers
  def initialize(encrypted_file, plain_file, key, offset_key)
    @encrypted_file = encrypted_file
    @plain_file = plain_file
    @key = key
    @file = Files.new
    @offset_key = offset_key
    @count = 0
    @text = ""
    @character_map = character_map
  end

  def decrypt(encrypted_text)
    encrypted_text.each_byte do |each_char|
      @text << @character_map[decrypt_helper(each_char, @count)]
      @count += 1
    end
    @text
  end

  def decrypt_helper(each_char, _count)
    (@character_map.index(each_char.chr) - get_total_rotation) % @character_map.size
  end

  def get_total_rotation
    total_rotation(@count, @key, offset_key(date_of_encryption))
  end

  def decrypt_write
    @file.write(@plain_file, decrypt(file_to_decript))
  end

  def file_to_decript
    @file.read(@encrypted_file).chomp
  end
end
