require_relative "files"
require_relative "enigmahelpers"

module ENIGMATICKEYS
  class PossibleKeys
    include EnigmaHelpers
    def initialize(weakness, tday, file_name)
      @weakness = weakness
      @tday = tday
      @file_name = file_name
      @read_write = Files.new
      @count = 0
      @file_crack = file_to_crack
      @total_length = @file_crack.length - 1
      @last_four = last_four_characters
    end

    def get_partial_key
      @partial_key = []
      @weakness.each_byte do |each_char|
        @partial_key[key_position(@count)] ||= []
        puts "#{key_position(@count)} : #{@last_four[@count]} : #{date_offset[key_position(@count)]}"
        @partial_key[key_position(@count)] << sub_key(each_char, @last_four[@count])
        @count += 1
      end
      @partial_key
    end
    # def get_partial_key
    #   @partial_key = []
    #   @weakness.each_byte do |each_char|
    #     @partial_key[key_position(@count)] ||= []
    #     puts "#{key_position(@count)} : #{@last_four[@count]} : #{date_offset[key_position(@count)]}"
    #     10.times do |i|
    #       10.times do |j|
    #          @partial_key[key_position(@count)] << "#{i}#{j}" if crack_different?(each_char, @last_four[@count], "#{i}#{j}".to_i)
    #       end
    #     end
    #     @count += 1
    #   end
    #   @partial_key
    # end

    def sub_key(plain_char, encrypted_char)
      sub_array = []
      10.times do |i|
        10.times do |j|
           sub_array << "#{i}#{j}" if crack_different?(plain_char, encrypted_char, "#{i}#{j}".to_i)
        end
      end
      sub_array
    end

    def crack_different?(plain_char, encrypted_char, test_value)
      case plain_char
      when 32..47 then crack_symbols?(plain_char, encrypted_char, test_value)
      when 97..122 then crack_alphabet?(plain_char, encrypted_char, test_value)
      end
    end

    def crack_alphabet?(plain_char, encrypted_char, test_value)
      ((((plain_char - 97) + (date_offset[key_position(@count)].to_i +
      test_value)) % 26) + 97).chr == encrypted_char
    end

    def crack_symbols?(plain_char, encrypted_char, test_value)
      ((((plain_char - 32) + (date_offset[key_position(@count)].to_i +
      test_value)) % 16) + 32).chr == encrypted_char
    end

    # def last_four(count)
    #   if count == 4
    #     return last_four_characters[-1]
    #   else
    #     return last_four_characters[count - 4]
    #   end
    # end

    def file_to_crack
      @file_crack ||= @read_write.read_file(@file_name).chomp
    end

    def find_rotation(encrypted_char)
      ((@total_length - 3) + @last_four.index(encrypted_char)) % 4
    end

    def key_position(count)
      find_rotation(@last_four[count])
    end

    def last_four_characters
      @file_crack.split("").last(4).join
    end

    def date_offset
      offset_key(@tday)
    end

    # end of class
  end
  # end of module
end
