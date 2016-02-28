require 'enigma/version'
require 'enigma/encryption'
require 'enigma/files'
require 'enigma/messages'
require 'enigma/validations'
# TODO: Add support namespace and modules
class EnigmaEncrpt
  include Validations

  def initialize
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
    @read_write.validate_encrypted_file(ARGV[1], start_encryption, ARGV[0])
    encryption_success
  end

  def file_to_encrypt
    @read_write.read_file(ARGV[0]).chomp #<< "..end.."
  rescue
    system(exit)
  end

  def encryption_success
    "created #{ARGV[0]} with key #{@encrypt.key} and date #{@encrypt.date_of_encryption}"
  end

  # end of class
end

test = EnigmaEncrpt.new
p test.test_write
