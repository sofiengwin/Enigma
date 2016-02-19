require "enigma/version"
require "enigma/encryption"
require "enigma/files"
require "enigma/messages"
require "enigma/validations"
require "pry"

class EnigmaEncrpt

    include Validations

  def initialize
    @messages = Messages.new()
  end

    def validate_length
      if check_argument(ARGV)
        check_argument(ARGV)
      else
          validate_file_type
      end
    end

    def validate_file_type
      if check_file_type(ARGV)
        check_file_type(ARGV)
      else
        validate_file_exist
      end
    end

    def validate_file_exist
      if check_file_exitence(ARGV)
        check_file_exitence(ARGV)
      else
        validations_complete
      end
    end

    def validations_complete
      @read_write = Files.new()
      @encrypt = Encryption.new(file_to_encrypt)
      binding.pry
      start_encryption
    end

  def start_encryption
    @encrypt.encrypt
  end

  def file_to_encrypt
    @read_write.read_file(ARGV[0])
  end



  #end of class
end

test = EnigmaEncrpt.new
p test.validate_length
