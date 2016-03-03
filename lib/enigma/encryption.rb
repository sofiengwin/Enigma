require "enigma"
class Encryption
  include Validations
  include EnigmaHelpers
  attr_accessor :count, :text, :key
  def initialize(plain_file, encrypted_file)
    @plain_file = plain_file
    @encrypted_file = encrypted_file
    @count = 0
    @key = generate_key
    @text = ""
    @character_map = character_map
    @read_write = Files.new
  end

  def encrypt(plain_text)
    plain_text.each_byte do |each_char|
      @text << @character_map[encrypt_helper(each_char, @count)]
      @count += 1
    end
    @text
  end

  def encrypt_helper(each_char, count)
  (@character_map.index(each_char.chr) + get_total_rotation) % @character_map.size
  end

  def get_total_rotation
    total_rotation(@count, @key, offset_key(date_of_encryption))
  end

# New contents

  def test_write
    @read_write.validate_encrypted_file(@encrypted_file, encrypt(file_to_encrypt), @plain_file)
  end

  def file_to_encrypt
    # begin
    @read_write.read_file(@plain_file).chomp
  # rescue
  #   system(exit)
  #   end
  end

  # def encryption_success
  #   "created #{ARGV[1]} with key #{@encrypt.key} and date #{@encrypt.date_of_encryption}"
  # end

  # end of class
end
