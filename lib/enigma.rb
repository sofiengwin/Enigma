require "enigma/version"
require "enigma/encryption"
require "enigma/files"
require "enigma/messages"
require "enigma/validations"

class EnigmaEncrpt

    include Validations

  def initialize
    @messages = Messages.new()
    @read_write = Files.new()
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
        start_encryption
      end
    end

    def validate_file_exist
      return validations_complete unless check_file_exitence(ARGV)
    end

    def validations_complete
      @encrypt = Encryption.new(file_to_encrypt)
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
