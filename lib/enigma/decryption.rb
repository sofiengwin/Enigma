require_relative "enigmahelpers"
class Decryption
  include EnigmaHelpers
  def initialize(key, offset_key)
    @count = 0
    @key = key
    @offset_key = offset_key
    @text = ""
    @character_map = character_map
  end

  def decrypt(string)
    string.each_byte do |each_char|
      @text << @character_map[decrypt_helper(each_char, @count)]
      @count += 1
    end
    @text
  end

  def decrypt_helper(each_char, count)
  (@character_map.index(each_char.chr) - get_total_rotation) % @character_map.size
  end

  def get_total_rotation
    total_rotation(@count, @key, offset_key(date_of_encryption))
  end

  # End of class
end
