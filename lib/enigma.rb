class Enigma

  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def date
    Time.now.strftime("%d%m%y")
  end
end
