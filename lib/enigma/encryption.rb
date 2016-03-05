require "enigma"
class Encryption
  include EnigmaHelpers
  attr_accessor :key
  def initialize(plain_file, encrypted_file)
    @plain_file = plain_file
    @encrypted_file = encrypted_file
    @count = 0
    @key = generate_key
    @character_map = character_map
    @file = Files.new
  end

  def encrypt(plain_text)
    text = ""
    plain_text.each_byte do |each_char|
      text << @character_map[encrypt_helper(each_char, @count)]
      @count += 1
    end
    text
  end

  def encrypt_helper(each_char, _count)
    (@character_map.index(each_char.chr) + get_total_rotation) % @character_map.size
  end

  def get_total_rotation
    total_rotation(@count, @key, offset_key(date_of_encryption))
  end

  def encrypt_write
    @file.write(@encrypted_file, encrypt(file_to_encrypt))
  end

  def file_to_encrypt
    @file.read(@plain_file).chomp
  end
end
