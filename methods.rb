module Enumerable
  
  def my_each
   return self.dup unless block_given?
   
   i = 0

   while i <= self.length - 1
    yield(self[i])
   i += 1
   end
  end

  def  my_each_with_index
  return self.dup unless block_given?
    i = 0
    while i <= self.length - 1
      yield(self[i], i)
      i += 1
    end
  end
  def my_select
    return self.dup unless block_given?
    new_array=[]
    i = 0
    self.my_each { 
      new_array << self[i] if yield(self[i]) 
      i += 1
    }
    return new_array
  end
end

 [1,2,3].my_each {|num| puts num}
 [1,2,3].my_each_with_index {|num, idx| puts "num is #{num} at index #{idx}"}
 p [1,2,3,4,5,6].my_select { |num| num.even? }
