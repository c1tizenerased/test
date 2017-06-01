class ArrayFinder
  attr_accessor :arr, :first_value

  def initialize(arr)
    @arr = arr
  end

# тут можно было бы использовать бинарный поиск, или сравнивать значения с индексами
# но можно и так(но это не точно)

  def find
    (arr.first..arr.last).to_a - arr
  end
end