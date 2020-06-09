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

  def test_enigma_attributes
    enigma = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
                "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
                "w", "x", "y", "z", " "]
    assert_equal expected, enigma.alphabet
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

  def test_split_key
    enigma = Enigma.new
    assert_equal [2, 27, 71, 15], enigma.split_key("02715")
  end

  def test_offsets
    enigma = Enigma.new
    assert_equal [1, 0, 2, 5], enigma.offsets("040895")
  end

  def test_create_shifts_date_and_key
    enigma = Enigma.new
    assert_equal [3, 27, 73, 20], enigma.shifts_date_and_key("02715", "040895")
  end

  def test_split_message
    enigma = Enigma.new
    expected = [["h", "e", "l", "l"],
                ["o", " ", "w", "o"],
                ["r", "l", "d"]]
    assert_equal expected, enigma.split_message("hello world")
  end

  def test_encrypt_with_key_and_date
    enigma = Enigma.new
    expected = { encryption: "keder ohulw",
                key: "02715",
                date: "040895" }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_decrypt_message_with_key_and_date
    enigma = Enigma.new
    expected = { decryption: "hello world",
                 key: "02715",
                 date: "040895" }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_encrypt_with_key_no_date
    enigma = Enigma.new
    expected = { encryption: "keder ohulw",
                key: "02715",
                date: "040895" }
    enigma.stubs(:date_today).returns("040895")
    assert_equal expected, enigma.encrypt("hello world", "02715")
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
