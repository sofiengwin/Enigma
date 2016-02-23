  require "enigma/decryption.rb"
  require "enigma/files.rb"
  require "enigma/messages"
class EnigmaDecrypt
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
    @read_write.write_file(ARGV[1], decrypt)
  end

  def file_to_decript
    # begin
    @read_write.read_file(ARGV[0]).chomp
  # rescue
  #     system(exit)
  #   end
  end

  # End of class
end

test = EnigmaDecrypt.new
p test.test_decrypt_write
