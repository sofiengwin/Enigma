require_relative "validations"
require_relative "enigmahelpers"
class Encryption
  include Validations
  include EnigmaHelpers
  attr_accessor :count, :text, :key
  def initialize
    @count = 0
    @key = "51569" # generate_key
    @text = ""
  end

  def encrypt(string)
    string.each_byte do |each_char|
      puts "#{each_char.chr} : #{@count}"
      @text << encrypt_different(each_char)
      @count += 1
    end
    @text
  end

  def encrypt_different(each_char)
    case each_char
    when 32..47 then encrypt_symbols(each_char)
    when 48..57 then encrypt_numbers(each_char)
    when 97..122 then encrypt_alphabets(each_char)
    end
  end

  def encrypt_alphabets(each_char)
    ((((each_char - 97) + get_total_rotation) % 26) + 97).chr
  end

  def encrypt_numbers(each_char)
    ((((each_char - 48) + get_total_rotation) % 10) + 48).chr
  end

  def encrypt_symbols(each_char)
    ((((each_char - 32) + get_total_rotation) % 16) + 32).chr
  end

  def get_total_rotation
    total_rotation(@count, @key, offset_key(date_of_encryption))
  end

  # end of class
end
