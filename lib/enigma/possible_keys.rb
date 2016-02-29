require_relative "files"
require_relative "enigmahelpers"

module ENIGMATICKEYS
  class PossibleKeys
    include EnigmaHelpers
    def initialize(weakness, date_of_encryption)
      @weakness = weakness
      @date_offset = date_of_encryption
      @read_write = Files.new
      @count = 0
      @total_length = file_to_crack.length - 1
      @last_four = last_four_characters
    end

    def get_partial_key
      @partial_key = []
      @weakness.each_byte do |each_char|
        @partial_key[key_position(@count)] ||= []
        puts "#{key_position(@count)} : #{@last_four[@count]} : #{date_offset[@count]}"
        10.times do |i|
          10.times do |j|
             @partial_key[key_position(@count)] << "#{i}#{j}" if crack_different?(each_char, @last_four[@count], "#{i}#{j}".to_i)
          end
        end
        @count += 1
      end
      @partial_key
    end

#     def get_partial_key
#   rotation_array = []
#   4.times do |x|
#     puts find_rotation(@last_four[x])
#     10.times do |i|
#       10.times do |j|
#         rotation_array[find_rotation(@last_four[x])] ||= []
#         rotation_array[find_rotation(@last_four[x])] << "#{i}#{j}" if
#           ((((@weakness[x].ord - 97) + (date_offset[x].to_i + "#{i}#{j}".to_i)) % 26) + 97).chr == @last_four[x]
#       end
#     end
#   end
#   rotation_array
# end

    def crack_different?(plain_char, encrypted_char, test_value)
      case plain_char
      when 32..47 then crack_symbols?(plain_char, encrypted_char, test_value)
      when 97..122 then crack_alphabet?(plain_char, encrypted_char, test_value)
      end
    end

    def crack_alphabet?(plain_char, encrypted_char, test_value)
      ((((plain_char - 97) + (date_offset[@count].to_i + test_value)) % 26) + 97).chr == encrypted_char
    end

    def crack_symbols?(plain_char, encrypted_char, test_value)
      ((((plain_char - 32) + (date_offset[@count].to_i + test_value)) % 16) + 32).chr == encrypted_char
    end

    # def last_four(count)
    #   if count == 4
    #     return last_four_characters[-1]
    #   else
    #     return last_four_characters[count - 4]
    #   end
    # end

    def file_to_crack
      @read_write.read_file(ARGV[0]).chomp
    end

    def find_rotation(encrypted_char)
      ((@total_length - 3) + @last_four.index(encrypted_char)) % 4
    end

    def key_position(count)
      find_rotation(@last_four[count])
    end

    def last_four_characters
      file_to_crack.split("").last(4).join
    end

    def date_offset
      offset_key(@date_offset)
    end

    # end of class
  end
  # end of module
end
