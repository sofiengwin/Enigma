require_relative "validations"
class Files
    include Validations
    attr_accessor :text

  def initialize
    @text = ""
    @messages = Messages.new()
  end

  def validate_encrypted_file(arguments2, encrypted_text)
    File.exist?(arguments2) ?  write_file(arguments2, encrypted_text): @messages.overwrite_file
  end

  def read_file(plain_text_file)
    begin
      File.open(plain_text_file).each do |line|
        @text << line
      end
      @text
    rescue => e
      warn error_message(e.class.to_s)
    end
  end

  def write_file(encrypted_file, encrypted_text)
  File.open(encrypted_file, 'w') {|f| f.write(encrypted_text) }
  end
  # File.open(local_filename, 'w') {|f| f.write(doc) }
  # End of class
end
