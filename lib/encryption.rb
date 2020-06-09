require_relative "shifter"

class Encryption < Shifter

  def encrypt(message, key = rand_number, date = date_today)
   {
     encryption: encrypt_m(message, key, date),
     key: key,
     date: date
   }
  end

  def encrypt_m(message, key = rand_number, date = date_today)
    encrypted = ""
    shifts = shifts_date_and_key(key, date)
    split_message(message).each do |chars|
      chars.zip(shifts).each do |char, shift_value|
        if alphabet.include?(char)
          new_index = (@alphabet.find_index(char) + shift_value) %27
          encrypted.concat(@alphabet[new_index])
        else
          encrypted.concat(char)
        end
      end
    end
    encrypted
  end

end
