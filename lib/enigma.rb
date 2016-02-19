require "enigma/version"
require "enigma/encryption"
require "enigma/files"
require "enigma/messages"
require "enigma/validations"

class EnigmaEncrpt

    include Validations

  def initialize
    @read_write = Files.new()
    @messages = Messages.new()
    @encrypt = Encryption.new(file_to_encrypt)
  end

  def start_encryption
    @encrypt.encrypt
  end

  def validations
    if ARGV.length > 0
      check_file_type(ARGV)
      check_file_exitence(ARGV)
      start_encryption
    else
      @messages.argument_error
    end
  end

  def file_to_encrypt
    @read_write.read_file(ARGV[0])
  end



  #end of class
end

test = EnigmaEncrpt.new
p test.validations
