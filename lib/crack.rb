require "enigma/files"
require "enigma/decryption"
require "enigma/validations"
require "enigma/enigmahelpers"
require "enigma/clean_key"
class EnigmaCrack
  include EnigmaHelpers
  include Validations
  def initialize
    @read_write = Files.new
    @messages = Messages.new
    @clean = ENIGMATICCLEAN::CleanKey.new
  end

  # TODO: Handle last_four count issues that migth arise
  # TODO: start testing from file to encrypt

  def testing
    clean.clean_key
  end

  def decrypted_text
    @decrypt = Decryption.new(@clean.clean_key, ARGV[2])
    @decrypt.decrypt(file_to_crack)
  end

  def test_crack
    @read_write.validate_encrypted_file(ARGV[1], decrypted_text, ARGV[0])
  end

  def file_to_crack
    @read_write.read_file(ARGV[0])
  end

    # end of class
  end
# test = EnigmaCrack.new
# # p test.get_partial_key("hell")
# # p test.find_rotation("g")
# p test.test_crack
