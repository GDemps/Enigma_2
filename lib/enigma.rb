class Enigma

  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def date_today
    Time.now.strftime("%d%m%y")
  end

  def rand_number
    4.times.map { (0..9).to_a.sample }.join.rjust(5, "0")
  end

  def split_key(key)
    key_array = []
    key.chars.each_cons(2){|chars| key_array << chars.join}
    key_array.map { |char| char.to_i }
  end

  def offsets(date)
    (date.to_i ** 2).to_s.chars.last(4).map { |char| char.to_i }
  end

  def shifts_date_and_key(key, date)
    split_key(key).zip(offsets(date)).map { |nums| nums.reduce(:+) }
  end

  def split_message(message)
    message.chars.each_slice(4).to_a.map do |chars|
      chars.map { |char| char.downcase }
    end
  end

  def encrypt(message, key = rand_number, date = date_today)
   {
     encryption: encrypt_m(message, key, date),
     key: key,
     date: date
   }
  end

  def decrypt(encrypted_message, key, date = date_today)
   {
     decryption: decrypt_m(encrypted_message, key, date),
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
