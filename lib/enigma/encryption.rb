  require_relative "validations"
class Encryption
    include Validations
    attr_accessor :count, :text
    def initialize
      @count = 0
      @key = "51569" #generate_key
      @text = ""
    end

    def encrypt(string)
      begin
      string.each_byte do |each_char|
          @text << encrypt_different(each_char)
        @count += 1
      end
      return @text
    rescue => e
        # warn error_message(e.class.to_s)
        warn "verrrrrrrrrrrrrry bad error"
      end
    end

    def encrypt_different(each_char)
      case each_char
      when 32..47 then encrypt_symbols(each_char)
      when 48..57 then encrypt_numbers(each_char)
      # when 91..96 then encrypt_special_characters(each_char)
      when 97..122 then encrypt_alphabets(each_char)
      end
    end

    def encrypt_alphabets(each_char)
      ((((each_char - 97) + total_rotation(@count)) % 26) + 97).chr
    end

    def encrypt_numbers(each_char)
      ascii_num = ((((each_char - 48) + total_rotation(@count)) % 10) + 48).chr
    end

    def encrypt_symbols(each_char)
      ascii_num = ((((each_char - 32) + total_rotation(@count)) % 16) + 32).chr
    end

    # def encrypt_special_characters(each_char)
    #   ascii_num = ((((each_char - 91) + total_rotation(@count)) % 6) + 91).chr
    # end

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
# TODO: Use the correct date format like 020315
    def date_of_encryption
      dd = Time.now
      "#{dd.day}#{dd.month}#{dd.year.to_s[-2..-1]}".to_i
    end

    def offset_key
    date_key = date_of_encryption
    date_key = date_key **2
    date_key.to_s[-4..-1]
    end

    #end of class
end
