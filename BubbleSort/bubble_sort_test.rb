require 'minitest/autorun'
require_relative 'bubble_sort'

class TestRoman < Minitest::Test
  def test_bubble_sort
    b = BubbleSort.new

    assert_equal([1, 2, 3], b.bubble_sort([3, 2, 1]))
    assert_equal([0, 2, 2, 3, 4, 78], b.bubble_sort([4, 3, 78, 2, 0, 2]))
    assert_equal([1, 2, 3], b.bubble_sort([3, 1, 2]))
  end
end
