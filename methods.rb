module Enumerable
  def my_each(array)
    size=array.size
    puts 'size: '+size
    size.times do
      yield
    end
  end
end