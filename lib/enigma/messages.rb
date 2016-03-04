module ENIGMA
class Messages
  def argument_error
    "Please enter the correct number of argument"
  end

  def file_type_error
    "This enigma machine only works with .txt files e.g master.txt"
  end

  def file_not_present
    "The file you are looking for does not exit"
  end

  def overwrite_file
    "The file exist would u like to over write it"
  end

  def self.success_message(file_name, key, date)
    "created #{file_name} with key #{key} and date #{date}"
  end
end
end
