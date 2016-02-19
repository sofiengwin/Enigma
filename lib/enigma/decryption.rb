class Decryption
    def initialize(string)
      @string = string
      @count = 0
      @key = "21583"
      @offset_key = "4256"
    end

    def decrypt
      @string.each_byte do |each_char|
          p ascii_num = ((((each_char - 97) - total_rotation(@count)) % 26) + 97).chr
        @count += 1
    end
  end

  def total_rotation(count)
    key_rotation(count) + offset_rotation(count)
  end

  def key_rotation(count)
    shift = count % 5
    @key[shift..shift + 1].to_i
  end

  def offset_rotation(count)
    shift = count % 4
    @offset_key[shift].to_i
  end
  # End of class
end
