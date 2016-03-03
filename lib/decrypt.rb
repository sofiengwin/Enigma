require "enigma/decryption.rb"
require "enigma/files.rb"
require "enigma/messages"
require "enigma/enigmahelpers"
require "enigma/validations"
class EnigmaDecrypt
  include EnigmaHelpers
  include Validations
  def initialize(encrypted_file, plain_file, key, date)
    @plain_file = plain_file
    @encrypted_file = encrypted_file
    @key = key
    @date = date
    @read_write = Files.new
    @messages = Messages.new
    @decrypt = Decryption.new(@key, @date)
  end

  # TODO: success message with key and date
  # TODO: Validate decrypt to show correct error_message when no key and date
  def decrypt
    @decrypt.decrypt(file_to_decript)
  end

  def decrypt_write
    if validate_decryption?(@key, @date)
      @read_write.validate_encrypted_file(@plain_file, decrypt, @encrypted_file)
      decryption_success
    else
      warn "Incorrect key or date use the correct format"
      exit
    end
  end

  def file_to_decript
    @read_write.read_file(@encrypted_file).chomp
  rescue
    #  warn error_message(e.class.to_s)
    exit
  end

  def decryption_success
    "created #{ARGV[1]} with key #{@key} and date #{@date}"
  end
end

test = EnigmaDecrypt.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
p test.decrypt_write
