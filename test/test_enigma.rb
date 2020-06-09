require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'mocha/minitest'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_instance_of_enigma
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_date_today
    enigma = Enigma.new
    enigma.stubs(:date_today).returns("040895")
    assert_equal "040895", enigma.date_today
  end

  def test_rand_number
    enigma = Enigma.new
    assert_equal "0", enigma.rand_number[0]
  end

end
