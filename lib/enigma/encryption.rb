class Encryption
    attr_accessor :count, :text
    def initialize(string)
      @string = string
      @count = 0
      @key = generate_key
      @text = ""
    end

    def encrypt
      @string.each_byte do |each_char|
          ascii_num = ((((each_char - 97) + total_rotation(@count)) % 26) + 97).chr
          @text << ascii_num
        @count += 1
      end
      return @text
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
      offset_key[shift].to_i
    end

    def generate_key
      [*1..9].sample(5).join("")
    end

    def date_of_encryption
      dd = Time.now
      "#{dd.day}#{dd.month}#{dd.year}".to_i
    end

    def offset_key
    date_key = date_of_encryption
    date_key = date_key **2
    date_key.to_s[-4..-1]
    end

    #end of class
end
