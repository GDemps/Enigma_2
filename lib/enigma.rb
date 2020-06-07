class Enigma

  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def date_today
    Time.now.strftime("%d%m%y")
  end

  def key_generator
    4.times.map { (0..9).to_a.sample }.join.rjust(5, "0")
  end

  def encrypt(message, key = key_generator, date = date_today)
    message = message.downcase
  end
end
