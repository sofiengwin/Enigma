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
  end

  # TODO: Handle last_four count issues that migth arise
  # TODO: start testing from file to encrypt

  def testing
    clean = ENIGMATICCLEAN::CleanKey.new
    clean.testing_link
  end

  def decrypted_text
    @decrypt = Decription.new(key, date_offset)
    @decrypt.decrypt(file_to_crack)
  end

  def test_crack
    @read_write.validate_encrypted_file(ARGV[0], decrypted_text, ARGV[1])
  end

    # end of class
  end
test = EnigmaCrack.new
# p test.get_partial_key("hell")
# p test.find_rotation("g")
p test.testing
