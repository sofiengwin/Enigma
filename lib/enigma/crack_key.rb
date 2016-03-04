module ENIGMA
  class Cracker
    def self.find_key(partial_key)
      @result = forward_check(partial_key)
      @result = backwards_check(@result)
      has_many = @result.any? { |element| element.size > 1 }
      find_key(@result) if has_many
      @result
    end

    def self.forward_check(partial_key)
      count = 0
      @new_array = []
      while count < partial_key.length
        forward_check_helper(partial_key, count)
        count += 1
      end
      @new_array[partial_key.length - 1] = partial_key.last
      @new_array
      end

    def self.forward_check_helper(partial_key, count)
      @new_array[count] ||= []
      partial_key[count].each_with_index do |item, _index|
        next if partial_key[count + 1].nil?
        partial_key[count + 1].each_with_index do |next_item, _index2|
          @new_array[count] << item if item[-1] == next_item[0]
        end
      end
      @new_array
    end

    def self.backwards_check(partial_key)
      count = partial_key.length - 1
      @new_array = []
      while count >= 0
        backwards_check_helper(partial_key, count)
        count -= 1
      end
      @new_array[0] = partial_key.first
      @new_array
    end

    def self.backwards_check_helper(partial_key, count)
      @new_array[count] ||= []
      partial_key[count].each_with_index do |item, _index|
        next if partial_key[count - 1].nil?
        partial_key[count - 1].each_with_index do |previous_item, _index2|
          @new_array[count] << item if previous_item[-1] == item[0]
        end
      end
      @new_array
    end

  end
end
