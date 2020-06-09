require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/encryption'

class EncryptionTest < Minitest::Test

  def test_encrypt_with_key_and_date
    enigma = Enigma.new
    expected = { encryption: "keder ohulw",
                key: "02715",
                date: "040895" }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_encrypt_with_key_no_date
    enigma = Enigma.new
    expected = { encryption: "keder ohulw",
                key: "02715",
                date: "040895" }
    enigma.stubs(:date_today).returns("040895")
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_encrypt_with_a_random_key_and_todays_date
     enigma = Enigma.new
     enigma.stubs(:date_today).returns("040895")
     enigma.stubs(:rand_number).returns("02715")
     expected = {
       encryption: "keder ohulw",
       key: "02715",
       date: "040895"
     }
     assert_equal expected, enigma.encrypt("hello world")
  end

end
