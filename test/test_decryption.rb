require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/decryption'

class DecryptionTest < Minitest::Test

  def test_decrypt_message_with_key_and_date
    enigma = Enigma.new
    expected = { decryption: "hello world",
                 key: "02715",
                 date: "040895" }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_decrypt_with_key_no_date
    enigma = Enigma.new
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    enigma.stubs(:date_today).returns("040895")
    assert_equal expected, enigma.decrypt("keder ohulw", "02715")
  end

  def test_decrypt_with_characters_not_in_alphabet_and_capital_letters
    enigma = Enigma.new
    enigma.stubs(:date_today).returns("040895")
    enigma.stubs(:rand_number).returns("02715")
    expected = {
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("Hello World!")
  end

  def test_decrypt_with_characters_not_in_alphabetand_capital_letters
    enigma = Enigma.new
    enigma.stubs(:date_today).returns("040895")
    expected = {
      decryption: "hello world!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("Keder Ohulw!", "02715")
  end

end
