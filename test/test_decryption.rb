require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/decryption'

class DecryptionTest < Minitest::Test

  def setup
    @decryption = Decryption.new
  end

  def test_it_exists
    assert_instance_of Decryption, @decryption
  end

  def test_decrypt_message_with_key_and_date
    expected = { decryption: "hello world",
                 key: "02715",
                 date: "040895" }
    assert_equal expected, @decryption.decrypt("keder ohulw", "02715", "040895")
  end

  def test_decrypt_with_key_no_date
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    @decryption.stubs(:date_today).returns("040895")
    assert_equal expected, @decryption.decrypt("keder ohulw", "02715")
  end

  def test_decrypt_with_characters_not_in_alphabetand_capital_letters
    @decryption.stubs(:date_today).returns("040895")
    expected = {
      decryption: "hello world!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @decryption.decrypt("Keder Ohulw!", "02715")
  end

end
