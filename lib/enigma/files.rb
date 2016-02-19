require_relative "messages"
require_relative "validations"
class Files
  include Validations
    attr_accessor :text

  def initialize
    @text = ""
  end

  def read_file(plain_text_file)
    File.open(plain_text_file).each do |line|
      @text << line
    end
    @text
  end

  def write_file

  end

  # End of class
end
