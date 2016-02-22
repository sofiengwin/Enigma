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
    @encrypt = Encryption.new
  end

  def start_encryption
    # begin
      @encrypt.encrypt(file_to_encrypt)
    # rescue => e
    #     puts e.class
    #   end
  end

  def test_write
    @read_write.validate_encrypted_file(ARGV[1], start_encryption, ARGV[0])
  end

  def file_to_encrypt
    begin
    @read_write.read_file(ARGV[0]).chomp
  rescue
      system(exit)
    end
  end

  # def create_encrypted_text
  #   @read_write.write_file(ARGV[1], @encrypt.encrypt)
  # end

  #end of class
end

test = EnigmaEncrpt.new
p test.test_write
