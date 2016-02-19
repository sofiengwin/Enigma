class Files
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

  def write_file(encrypted_file, encrypted_text)
    File.open(encrypted_file, "w+").each do |line|
      line.puts encrypted_text
    end
  end

  # End of class
end
