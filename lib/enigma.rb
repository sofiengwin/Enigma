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

    def validate_length
      if is_rigth_length?(ARGV)
        warn check_argument(ARGV)
      else
        validate_file_type
      end
    end

    def validate_file_type
      if is_rigth_file_type?(ARGV)
        warn check_file_type(ARGV)
      else
        validate_file_exist
      end
    end

    def validate_file_exist
      if does_file_exist?(ARGV[0])
        warn check_file_exitence(ARGV[0])
      else
        start_encryption
      end
    end

  def start_encryption
    # begin
      @encrypt.encrypt(file_to_encrypt)
    # rescue => e
    #     puts e.class
    #   end
  end

  def test_write
    @read_write.validate_encrypted_file(ARGV[1], start_encryption)
  end

  def file_to_encrypt
    begin
    @read_write.read_file(ARGV[0]).chomp
  rescue
      p "Closing because there is no file to read"
    end
  end

  # def create_encrypted_text
  #   @read_write.write_file(ARGV[1], @encrypt.encrypt)
  # end

  #end of class
end

test = EnigmaEncrpt.new
p test.test_write
