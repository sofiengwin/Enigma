require_relative "possible_keys"
require_relative "enigmahelpers"
module ENIGMATICCRACKER
  class Crack
    include EnigmaHelpers
    def initialize(weakness, date, encrypted_file)
      @weakness = weakness
      @date = date
      @encrypted_file = encrypted_file
      @possible_keys = ENIGMATICKEYS::PossibleKeys.new(@weakness, @date, @encrypted_file)
    end

    def get_partial
      @possible_keys.get_partial_key
    end

    def find_key(test_array)
      @result = forward_check(test_array)
      @result = backwards_check(@result)
      has_many = @result.any? { |element| element.size > 1 }
      find_key(@result) if has_many
      @result
    end

    def forward_check(test)
      count = 0
      @new_array = []
      while count < test.length
        forward_check_helper(test, count)
        count += 1
      end
      @new_array[test.length - 1] = test.last
      @new_array
      end

      def forward_check_helper(test, count)
        @new_array[count] ||= []
        test[count].each_with_index do |item, _index|
          next if test[count + 1].nil?
          test[count + 1].each_with_index do |next_item, _index2|
            @new_array[count] << item if item[-1] == next_item[0]
          end
        end
        @new_array
      end

    def backwards_check(test)
      count = test.length - 1
      @new_array = []
      while count >= 0
        backwards_check_helper(test, count)
        count -= 1
      end
      @new_array[0] = test.first
      @new_array
    end

  def backwards_check_helper(test, count)
    @new_array[count] ||= []
    test[count].each_with_index do |item, _index|
      next if test[count - 1].nil?
      test[count - 1].each_with_index do |previous_item, _index2|
        @new_array[count] << item if previous_item[-1] == item[0]
      end
    end
    @new_array
  end
    # end of class
  end
  # end of module
end
