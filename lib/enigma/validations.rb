module Validations

  def check_file_type(arguments)
    arguments.each_with_index do |value, index|
      return @messages.file_type_error unless value.include? ".txt"
      break if index == 1
    end
  end

  def check_file_exitence(arguments)
    arguments.each_with_index do |value, index|
      return @messages.file_not_present unless File.exist?(value)
      break if index == 1
    end
  end

  def check_argument(arguments)
    @messages.argument_error unless arguments.length > 0
  end

# End of file
end
