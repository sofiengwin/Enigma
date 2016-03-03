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
  # TODO: Use a test_encrypt file for all rspec tests
  def start_encryption
    @encrypt.encrypt(file_to_encrypt)
  end

  def encrypt_write
    @read_write.validate_encrypted_file(@arg_two, start_encryption, @arg_one)
  end

  def file_to_encrypt
    @read_write.read_file(@arg_one).chomp << "..nd.."
  rescue
    exit
  end

  # end of class
end

# test = EnigmaEncrpt.new(ARGV[0], ARGV[1])
# p test.encrypt_write
