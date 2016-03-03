require "enigma"
module ENIGMA
  class Crack
    def initialize(encrypted_file, date)
      @encrypted_file = encrypted_file
      @date = date
      @possible_keys = ENIGMATICKEYS::PossibleKeys.new("nd..", @encrypted_file, @date)
    end

    def cracked_key
      ENIGMA::Cracker.find_key(@possible_keys.get_partial)
    end

    def testing
      @possible_keys.get_partial_key
    end

    def clean_key
    key = ""
    cracked_key.each_with_index do |item, index|
      key << item[0] if index == 0
      key << item[0][1] if index > 0
    end
    key
    end

# # new contents
#     def decrypted_text
#       @decrypt = Decryption.new(@key, @date)
#       @decrypt.decrypt(file_to_crack)
#     end
#
#
#     def crack_write
#       @read_write.validate_encrypted_file(@plain_file, decrypted_text, @encrypted_file)
#       # crack_success
#     end
#
#     def file_to_crack
#       @read_write.read_file(@encrypted_file)
#     end
#
#     def crack_success
#       "created #{ARGV[1]} with key #{@key} and date #{@date}"
#     end

    # end of class
  end
  # end of module
end
