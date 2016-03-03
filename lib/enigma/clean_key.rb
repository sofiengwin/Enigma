require_relative "crack_key"
module ENIGMATICCLEAN
  class CleanKey
    def initialize(weakness, date, encrypted_file)
      @weakness = weakness
      @date = date
      @encrypted_file = encrypted_file
      @clean_keys = ENIGMATICCRACKER::Crack.new(@weakness, @date, @encrypted_file)
    end

    def cracked_key
      @clean_keys.find_key(@clean_keys.get_partial)
    end

    def clean_key
    key = ""
    cracked_key.each_with_index do |item, index|
      key << item[0] if index == 0
      key << item[0][1] if index > 0
    end
    key
    end

    # end of class
  end
  # end of module
end
