module EnigmaHelpers
  def total_rotation(count, key, offsetkey)
    key_rotation(count, key) + offset_rotation(count, offsetkey)
  end

  def key_rotation(count, key)
    shift = count % 5
    key[shift..shift + 1].to_i
  end

  def offset_rotation(count, offsetkey)
    shift = count % 4
    offsetkey[shift].to_i
  end

  def format_month(month)
    month < 10 ? "0" << month.to_s : month
  end

  def date_of_encryption
    dd = Time.now
    "#{dd.day}#{format_month(dd.month)}#{dd.year.to_s[-2..-1]}".to_i
  end

  def offset_key(date_of_encryption)
    date_key = date_of_encryption.to_i
    date_key ** 2
    date_key.to_s[-4..-1]
  end
  # End of module
end
