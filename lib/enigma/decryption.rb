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
      @text << ascii_num = ((((each_char - 97) - total_rotation(@count, @key, @offset_key)) % 26) + 97).chr
      @count += 1
    end
    @text
end

  # End of class
end
