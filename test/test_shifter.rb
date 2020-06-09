require './test/test_helper'
require './lib/shifter'

class ShifterTest < Minitest::Test

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

end
