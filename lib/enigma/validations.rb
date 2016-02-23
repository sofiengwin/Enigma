module Validations

  def check_file_type(arguments)
    arguments.each_with_index do |value, index|
      return @messages.file_type_error unless value.include? ".txt"
      break if index == 1
    end
  end

  def check_file_exitence
      return @messages.file_not_present
  end

  def check_argument
    @messages.argument_error
  end

# TODO: Refactor this method to be less than six lines
  def error_message(error_class)
    case error_class
    when "TypeError" then check_argument
    when "Errno::ENOENT" then check_file_exitence
    when "NoMethodError" then check_file_exitence
    else
      "Uknown Error"
    end
  end

  def is_file_present?(argument1, argument2)
    File.exist?(argument1) && File.exist?(argument2)
  end

  def is_valid_text_file?(argument2)
    argument2.include? ".txt"
  end

  def validate_decryption?(key, date_offset)
    validate_key?(key) && validate_date_offset?(date_offset)
  end

  def validate_key?(key)
    key.length == 5
  end

  def validate_date_offset?(date_offset)
    date_offset.length == 6
  end


# End of file
end
