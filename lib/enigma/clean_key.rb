require_relative "crack_key"
module ENIGMATICCLEAN
  class CleanKey
    def initialize
      @clean_keys = ENIGMATICCRACKER::Crack.new
    end

    def testing_link
      @clean_keys.get_partial
    end

    # end of class
  end
  # end of module
end
