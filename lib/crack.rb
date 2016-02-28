require "enigma/files"
require "enigma/decryption"
require "enigma/validations"
require "enigma/enigmahelpers"
class EnigmaCrack
    include EnigmaHelpers
    include Validations
  def initialize(date_of_encryption)
    @read_write = Files.new
    @messages = Messages.new
    @date_offset = date_of_encryption
    @count = 0
  end

  # TODO: Handle last_four count issues that migth arise
  # TODO: start testing from file to encrypt
  # String represents the weakness of each message ending with ..end..
  def get_partial_key(string)
    partial_key = []
    string.each_byte do |each_char|
      partial_key[find_rotation(last_four(@count))] ||= []
      10.times do |i|
        10.times do |j|
          partial_key[find_rotation(last_four(@count))] << "#{i}#{j}" if test_key?(each_char, last_four(@count), "#{i}#{j}".to_i)
        end
      end
      @count += 1
    end
    partial_key
  end


  def test_key?(plain_char, encrypted_char, test_value)
    ((((plain_char - 97) + (date_offset[@count].to_i + test_value)) % 26) + 97).chr == encrypted_char
  #   ((((each_char - 97) + (6 + test_value)) % 26) + 97).chr == encrypted_char
  end

  def last_four(count)
    if count == 4
      return last_four_characters[-1]
    else
      return last_four_characters[count - 4]
    end
  end

  def testing
    find_key(get_partial)
  end

  # def character_position(encrypted_char)
  #   total_length = file_to_crack.length
  #   chr_pos = (total_length + last_four_characters.index(encrypted_char)) - total_length
  # end

  # def crack_key
  #
  # end

  def find_rotation(encrypted_char)
    total_length = file_to_crack.length
    rotation = ((total_length + last_four_characters.index(encrypted_char)) - total_length) % 4
  end

  def last_four_characters
    file_to_crack.split("").last(4).join
  end



  def file_to_crack
    @read_write.read_file(ARGV[0]).chomp
  end

  # def encryption_weakness
  #   file_to_crack.last(3)
  # end

  def decrypted_text
    @decrypt = Decription.new(key, date_offset)
    @decrypt.decrypt(file_to_crack)
  end

  def date_offset
    offset_key(@date_offset)
  end

  def test_crack
    @read_write.validate_encrypted_file(ARGV[0], decrypted_text, ARGV[1])
  end

  def get_partial
    get_partial_key("hell")
  end

  ####################
  def find_key(get_partial)
  @result = forward_check(get_partial)
  @result = backwards_check(@result)

  has_many = @result.any? do |element|
    element.size > 1
  end

  # puts "New Array = ", @new_array.inspect
  find_key(@result) if has_many
  @result
end
  ###################
  def forward_check(test)
  count = 0
  @new_array = []
  while count < test.length
  @new_array[count] ||= []
    test[count].each_with_index do |item, index|
      unless test[count + 1].nil?
        test[count + 1].each_with_index do |next_item, index2|
          @new_array[count] << item if item[-1] == next_item[0]
        end
      end
    end
    count += 1
  end
  @new_array[test.length - 1] = test.last
  @new_array
end
  ###############
  ###############
  def backwards_check(test)
  count = test.length - 1
  @new_array = []
  while count >= 0
  @new_array[count] ||= []
  # binding.pry
    test[count].each_with_index do |item, index|
      unless test[count - 1].nil?
        test[count - 1].each_with_index do |previous_item, index2|
          @new_array[count] << item if previous_item[-1] == item[0]
        end
      end
    end
    count -= 1
  end
  @new_array[0] = test.first
  @new_array
end
  ###############
# end of class
  end
test = EnigmaCrack.new("240216")
 # p test.get_partial_key("hell")
# p test.find_rotation("g")
p test.testing
