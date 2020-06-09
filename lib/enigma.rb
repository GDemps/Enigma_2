require "./lib/encryption"
require "./lib/decryption"

class Enigma

  attr_reader :encryption, :decryption
  def initialize
    @encryption = Encryption.new
    @decryption = Decryption.new
  end

  def date_today
    Time.now.strftime("%d%m%y")
  end

  def rand_number
    4.times.map { (0..9).to_a.sample }.join.rjust(5, "0")
  end

  def encrypt(message, key = rand_number, date = date_today)
   @encryption.encrypt(message, key, date)
  end

  def decrypt(encrypted_message, key, date = date_today)
   @decryption.decrypt(encrypted_message, key, date)
  end

end
