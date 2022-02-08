module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    size.times { |idx| yield self[idx] }
    self
  end

  def my_each_with_index
    size.times { |idx| yield(self[idx], idx) }
    self
  end

  def my_select
    result = []
    size.times { |idx| result << self[idx] if yield self[idx] }
    result
  end

  def my_all?
    size.times { |idx| return false unless yield self[idx] }
    true
  end

  def my_any?
    size.times { |idx| return true if yield self[idx] }
    false
  end

  def my_none?
    size.times { |idx| return false if yield self[idx] }
    true
  end

  def my_count
    return size unless block_given?

    count = 0
    size.times { |idx| count += 1 if yield self[idx] }
    count
  end

  def my_map
    result = []

    size.times { |idx| result.push(yield self[idx]) }

    result
  end

  def my_inject(initial_value = 0)
    sum = initial_value

    size.times { |idx| sum = yield(sum, self[idx]) }

    sum
  end
end
