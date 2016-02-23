require_relative "enigmahelpers"
class Decryption
    include EnigmaHelpers
    # attr_accessor :count
    def initialize(key, offset_key)
      @count = 0
      @key = key
      @offset_key = offset_key
      @text = ""
    end

    def decrypt(string)
      string.each_byte do |each_char|
        @text << ascii_num = ((((each_char - 97) - total_rotation(@count, @key, @offset_key)) % 26) + 97).chr
        @count += 1
    end
    @text
  end
  #
  # def total_rotation(count)
  #   key_rotation(count) + offset_rotation(count)
  # end
  #
  # def key_rotation(count)
  #   shift = count % 5
  #   @key[shift..shift + 1].to_i
  # end
  #
  # def offset_rotation(count)
  #   shift = count % 4
  #   offset_key[shift].to_i
  # end
  #
  # def offset_key
  # date_key = 22216
  # date_key = date_key **2
  # date_key.to_s[-4..-1]
  # end
  # End of class
end
