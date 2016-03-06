require "pry"
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
      @new_partial = []
      while count < partial_key.length
        forward_check_helper(partial_key, count)
        count += 1
      end
      @new_partial[partial_key.length - 1] = partial_key.last
      @new_partial
      end

    def self.forward_check_helper(partial_key, count)
      @new_partial[count] ||= []
      partial_key[count].each_with_index do |item, _index|
        next if partial_key[count + 1].nil?
        partial_key[count + 1].each_with_index do |next_item, _index2|
          @new_partial[count] << item if item[-1] == next_item[0]
        end
      end
      @new_partial
    end

    def self.backwards_check(partial_key)
      count = partial_key.length - 1
      @new_partial = []
      while count >= 0
        backwards_check_helper(partial_key, count)
        count -= 1
      end
      @new_partial[0] = partial_key.first
      @new_partial
    end

    def self.backwards_check_helper(partial_key, count)
      @new_partial[count] ||= []
      partial_key[count].each_with_index do |item, _index|
        next if partial_key[count - 1].nil?
        partial_key[count - 1].each_with_index do |previous_item, _index2|
          @new_partial[count] << item if previous_item[-1] == item[0]
        end
      end
      @new_partial
    end
    # TODO: Add a block that does matching base on strategy
      # def self.find_key_helper(partial_key, count, strategy)
      #   binding.pry
      #   @new_partial[count] ||= []
      #   partial_key[count].each_with_index do |item, index|
      #     next if partial_key[count.send(strategy, 1)].nil?
      #     partial_key[count.send(strategy, 1)].each_with_index do |next_item, index2|
      #       @new_partial[count] << item if item[-1] == next_item[0]
      #     end
      #   end
      #   @new_partial
      # end
  end
end
