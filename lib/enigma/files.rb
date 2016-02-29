require_relative "validations"
require_relative "messages"
class Files
  include Validations
  attr_accessor :text

  def initialize
    @text = ""
    @messages = Messages.new
  end

  # TODO: Error caused by passing only one argument which affects argument2.exist?
  def validate_encrypted_file(argument2, encrypted_text, argument1)
    if File.exist?(argument2) && is_valid_text_file?(argument2)
      should_i_overwrite(argument2, encrypted_text, argument1)
    elsif is_valid_text_file?(argument2)
      write_file(argument2, encrypted_text)
    else
      warn "You can only encrypt to valid text files"
    end
  end

  def should_i_overwrite(argument2, encrypted_text, argument1)
    p @messages.overwrite_file
    choice = STDIN.gets.chomp if is_file_present?(argument1, argument2)
    if choice == "yes"
      write_file(argument2, encrypted_text)
    else
      puts "Sorry cannot continue with encryption"
    end
  end

  def read_file(plain_text_file)
    File.open(plain_text_file).each do |line|
      @text << line
    end
    @text
  rescue => e
    warn error_message(e.class.to_s)
  end

  def write_file(encrypted_file, encrypted_text)
    File.open(encrypted_file, "w") { |f| f.write(encrypted_text) }
  end
  # File.open(local_filename, 'w') {|f| f.write(doc) }
  # End of class
end
