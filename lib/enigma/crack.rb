require "enigma"
module ENIGMA
  class Crack
    def initialize(encrypted_file, plain_file, date)
      @encrypted_file = encrypted_file
      @plain_file = plain_file
      @date = date
      @file = Files.new
      @possible_keys = ENIGMA::PossibleKeys.new(@encrypted_file, @date)
    end

    def cracked_key
      ENIGMA::Cracker.find_key(@possible_keys.get_partial_key("nd.."))
    end

    def clean_key
      key = ""
      cracked_key.each_with_index do |item, index|
        key << item[0] if index == 0
        key << item[0][1] if index > 0
      end
      key
    end

    def decrypted_text
      @decrypt = Decryption.new(@encrypted_file, @plain_file, clean_key, @date)
      @decrypt.decrypt(file_to_crack)
    end

    def crack_write
      @file.write(@plain_file, decrypted_text)
    end

    def file_to_crack
      @file.read(@encrypted_file)
    end
  end
end
