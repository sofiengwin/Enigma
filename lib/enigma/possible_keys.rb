require_relative "files"
require_relative "enigmahelpers"

module ENIGMATICKEYS
  class PossibleKeys
    include EnigmaHelpers
    def initialize(file_name, tday)
      @tday = tday
      @file_name = file_name
      @read_write = Files.new
      @count = 0
      @file_crack = file_to_crack
      @last_four = last_four_characters
      @character_map = character_map
    end

    def get_partial_key(weakness)
      @partial_key = []
      weakness.each_byte do |each_char|
        @partial_key[key_position(@count)] ||= []
        @partial_key[key_position(@count)] = sub_key(each_char, @last_four[@count])
        @count += 1
      end
      @partial_key
    end

    def sub_key(plain_char, encrypted_char)
      sub_array = []
      10.times do |i|
        10.times do |j|
          sub_array << "#{i}#{j}" if crack_helper?(plain_char, encrypted_char, "#{i}#{j}".to_i)
        end
      end
      sub_array
    end

    def crack_helper?(plain_char, encrypted_char, test_value)
      @character_map[crack_test(plain_char, test_value)] == encrypted_char
    end

    def crack_test(plain_char, test_value)
      (@character_map.index(plain_char.chr) + (date_offset[key_position(@count)].to_i + test_value)) % @character_map.size
    end

    def file_to_crack
      @file_crack ||= @read_write.read_file(@file_name).chomp
    end

    def find_rotation(_encrypted_char)
      total_length = @file_crack.length - 1
      ((total_length - 3) + @last_four.index(@last_four[@count])) % 4
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
