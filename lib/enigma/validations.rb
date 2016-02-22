module Validations

  def check_file_type(arguments)
    arguments.each_with_index do |value, index|
      return @messages.file_type_error unless value.include? ".txt"
      break if index == 1
    end
  end

  # def check_file_exitence(arguments)
  #   arguments.each_with_index do |value, index|
  #     return @messages.file_not_present unless File.file?(value)
  #     break if index == 1
  #   end
  # end

  def check_file_exitence
      return @messages.file_not_present
  end

  def check_argument
    @messages.argument_error
  end

  def is_rigth_length?(argument)
      check_argument(argument) ? true : false
  end

  def is_rigth_file_type?(argument)
      check_file_type(argument) ? true : false
  end

  def does_file_exist?(argument1)
      check_file_exitence(argument1) ? true : false
  end

  def error_message(error_class)
    case error_class
    when "TypeError" then check_argument
    when "Errno::ENOENT" then check_file_exitence
    else
      "Uknown Error"
    end
  end


# End of file
end
