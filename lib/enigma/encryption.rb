require_relative "validations"
require_relative "enigmahelpers"
class Encryption
  include Validations
  include EnigmaHelpers
  attr_accessor :count, :text, :key
  def initialize
    @count = 0
    @key = generate_key
    @text = ""
    @character_map = character_map
  end

  def encrypt(string)
    string.each_byte do |each_char|
      puts " #{@count}: #{each_char.chr}: #{key_rotation(@count, @key)} #{offset_rotation(@count, offset_key(date_of_encryption))}"
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

  # end of class
end
