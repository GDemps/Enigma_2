require_relative "shifter"

class Encryption < Shifter

  def decrypt(encrypted_message, key, date = date_today)
    {
      decryption: decrypt_m(encrypted_message, key, date),
      key: key,
      date: date
    }
  end

  def decrypt_m(message, key = rand_number, date = date_today)
    decrypted = ""
    shifts = shifts_date_and_key(key, date)
    split_message(message).each do |chars|
      chars.zip(shifts).each do |char, shift_value|
        if alphabet.include?(char)
          new_index = (@alphabet.find_index(char) - shift_value) %27
          decrypted.concat(@alphabet[new_index])
        else
          decrypted.concat(char)
        end
      end
    end
    decrypted
  end

end
