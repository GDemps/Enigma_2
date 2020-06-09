require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/encryption'

class EncryptionTest < Minitest::Test

  def setup
   @encryption = Encryption.new
  end

  def test_it_exists
   assert_instance_of Encryption, @encryption
  end

  def test_encrypt_with_key_and_date
    expected = { encryption: "keder ohulw",
                key: "02715",
                date: "040895" }
    assert_equal expected, @encryption.encrypt("hello world", "02715", "040895")
  end

  def test_encrypt_with_key_no_date
    expected = { encryption: "keder ohulw",
                key: "02715",
                date: "040895" }
    @encryption.stubs(:date_today).returns("040895")
    assert_equal expected, @encryption.encrypt("hello world", "02715")
  end

  def test_encrypt_with_a_random_key_and_todays_date
     @encryption.stubs(:date_today).returns("040895")
     @encryption.stubs(:rand_number).returns("02715")
     expected = {
       encryption: "keder ohulw",
       key: "02715",
       date: "040895"
     }
     assert_equal expected, @encryption.encrypt("hello world")
  end

end
