require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_instance_of_enigma
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_enigma_attributes
    enigma = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
                "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
                "w", "x", "y", "z", " "]
    assert_equal expected, enigma.alphabet
  end

  def test_date
    enigma = Enigma.new
    #add a stub here before submission
    assert_equal "070620", enigma.date
  end

  def test_key_generator
    enigma = Enigma.new
    assert_equal "0", enigma.key_generator[0]
  end

end
