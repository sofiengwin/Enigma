require "enigma/decryption.rb"
require "enigma/files.rb"
require "enigma/messages"
require "enigma/enigmahelpers"
require "enigma/validations"
class EnigmaDecrypt
  include EnigmaHelpers
  include Validations
  def initialize
    @decrypt = Decryption.new(ARGV[2], ARGV[3])
    @read_write = Files.new
    @messages = Messages.new
  end

  # TODO: success message with key and date
  def decrypt
    @decrypt.decrypt(file_to_decript)
  end

  def test_decrypt_write
    if validate_decryption?(ARGV[2], ARGV[3])
      @read_write.validate_encrypted_file(ARGV[1], decrypt, ARGV[0])
    else
      warn "Incorrect key or date use the correct format"
      exit
    end
  end

  def file_to_decript
    @read_write.read_file(ARGV[0]).chomp
  rescue
    #  warn error_message(e.class.to_s)
    exit
  end
  # End of class
end

test = EnigmaDecrypt.new
p test.test_decrypt_write
