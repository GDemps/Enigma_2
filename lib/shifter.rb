class Shifter

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

 #  def shift_amount(encrypted_char, end_char)
 #   (@alphabet.find_index(encrypted_char) - @alphabet.find_index(end_char)) % 27
 #  end

end
