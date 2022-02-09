class MergeSort
  def split_array(array)
    array.each_slice((array.size / 2.0).round).to_a
  end

  def merge(left, right, result = [])
    (left.size + right.size).times do
      result << if left.empty?
                  right.shift
                elsif right.empty?
                  left.shift
                elsif left.first < right.first
                  left.shift
                else
                  right.shift
                end
    end
    result
  end

  def merge_sort(array)
    return array if array.size < 2

    left, right = split_array(array)

    left = merge_sort(left)
    right = merge_sort(right)
    merge(left, right)
  end
end
