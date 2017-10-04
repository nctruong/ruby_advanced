# https://www.sitepoint.com/heap-data-structure-ruby/

class Heap
  attr_accessor :heap_size, :array_rep

  def left_child(index)
    2*index + 1
  end

  def right_child(index)
    2*index + 2
  end

  def left_child_key(index)
    @array_rep[left_child(index)]
  end

  def right_child_key(index)
    @array_rep[right_child(index)]
  end

  def leaf_node?(index)
    return index >= @heap_size/2
  end

  def satisfied?(index)
    @array_rep[index] >= left_child_key(index) and
        @array_rep[index] >= right_child_key(index)
  end

  def fix_one_error(index)
    return if leaf_node?(index) || satisfied?(index)

    left_child_key = @array_rep[left_child(index)]
    right_child_key = @array_rep[right_child(index)]

    larger_child = if left_child_key > right_child_key then left_child(index)
                   else right_child(index) end

    @array_rep[index], @array_rep[larger_child] = @array_rep[larger_child],
        @array_rep[index]

    fix_one_error(larger_child)
  end

  def create_max_heap
    (0..@heap_size/2-1).to_a.reverse.each do |index|
      fix_one_error(index)
    end
  end

  def get_max
    array_rep[0]
  end

  def get_and_remove_max
    array_rep[@heap_size-1], array_rep[0] = array_rep[0], array_rep[@heap_size-1]
    @heap_size -= 1
    fix_one_error(0)
  end
end