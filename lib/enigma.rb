require "enigma/version"
require "enigma/encryption"
require "enigma/files"
require "enigma/messages"
require "enigma/validations"
# TODO: Add support namespace and modules
class EnigmaEncrpt
  include Validations

  def initialize(arg_one, arg_two)
    @arg_one = arg_one
    @arg_two = arg_two
    @messages = Messages.new
    @read_write = Files.new
    @encrypt = Encryption.new
  end

  # TODO: success message with key and date
  # TODO: Add ..end.. to the end of every message
  def start_encryption
    @encrypt.encrypt(file_to_encrypt)
  end

  def test_write
    @read_write.validate_encrypted_file(@arg_two, start_encryption, @arg_one)
    encryption_success
  end

  def file_to_encrypt
    @read_write.read_file(@arg_one).chomp << "nd.."
  rescue
    exit
  end

  def encryption_success
    "created #{@arg_two} with key #{@encrypt.key} and date #{@encrypt.date_of_encryption}"
  end

  # end of class
end

# test = EnigmaEncrpt.new(ARGV[0], ARGV[1])
# p test.test_write
