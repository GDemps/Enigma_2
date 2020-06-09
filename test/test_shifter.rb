require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/shifter'

class ShifterTest < Minitest::Test

  def setup
    @shifter = Shifter.new
  end

  def test_it_exists
    assert_instance_of Shifter, @shifter
  end

  def test_it_has_an_alphabet
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @shifter.alphabet
  end

  def test_split_key
    assert_equal [2, 27, 71, 15], @shifter.split_key("02715")
  end

  def test_offsets
    assert_equal [1, 0, 2, 5], @shifter.offsets("040895")
  end

  def test_create_shifts_date_and_key
    assert_equal [3, 27, 73, 20], @shifter.shifts_date_and_key("02715", "040895")
  end

  def test_split_message
    expected = [["h", "e", "l", "l"],
                ["o", " ", "w", "o"],
                ["r", "l", "d"]]
    assert_equal expected, @shifter.split_message("hello world")
  end

end
