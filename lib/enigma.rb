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
    key_array
  end

  # def encrypt(message, key = key_generator, date = date_today)
  #   message = message.downcase
  #
  # end

  # def shift
  #   a_key = key[0..1]
  #   b_key = key[1..2]
  #   c_key = key[2..3]
  #   d_key = key[3..4]
  #   last4 = (date.to_i * date.to_i).to_s[-4..-1]
  #   a_offset = last4[0]
  #   b_offset = last4[1]
  #   c_offset = last4[2]
  #   d_offset = last4[3]
  #   [a = a_key.to_i + a_offset.to_i,
  #    b = b_key.to_i + b_offset.to_i,
  #    c = c_key.to_i + c_offset.to_i,
  #    d = d_key.to_i + d_offset.to_i]
  # end

end
