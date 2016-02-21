require_relative "validations"
class Files
    include Validations
    attr_accessor :text

  def initialize
    @text = ""
    @messages = Messages.new()
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
    File.open(encrypted_file, "w+").each do |line|
      line.puts encrypted_text
    end
  end
  # File.open(local_filename, 'w') {|f| f.write(doc) }


  # End of class
end
