class BubbleSort
  def bubble_sort(list)
    length = list.length

    (0...length).each do |i|
      (0...(length - 1 - i)).each do |j|
        list[j], list[j + 1] = list[j + 1], list[j] if list[j] > list[j + 1]
      end
    end

    list
  end
end
