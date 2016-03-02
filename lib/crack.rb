require "enigma/files"
require "enigma/decryption"
require "enigma/validations"
require "enigma/enigmahelpers"
require "enigma/clean_key"
class EnigmaCrack
  include EnigmaHelpers
  include Validations
  def initialize(weakness, date, encrypted_file, plain_file)
    @weakness = weakness
    @date = date
    @encrypted_file = encrypted_file
    @plain_file = plain_file
    @read_write = Files.new
    @messages = Messages.new
    @clean = ENIGMATICCLEAN::CleanKey.new(@weakness, @date, @encrypted_file)
  end

  # TODO: Handle last_four count issues that migth arise
  # TODO: start testing from file to encrypt
  # TODO: Validate date format
  # TODO: Validate agrv[0] error

  def decrypted_text
    @decrypt = Decryption.new(@clean.clean_key, @date)
    @decrypt.decrypt(file_to_crack)
  end

  def crack_write
    @read_write.validate_encrypted_file(@plain_file, decrypted_text, @encrypted_file)
  end

  def file_to_crack
    @read_write.read_file(@encrypted_file)
  end

    # end of class
  end
# test = EnigmaCrack.new("nd..", ARGV[2], ARGV[0], ARGV[1])
#
# p test.crack_write
