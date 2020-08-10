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


end

 [1,2,3].my_each {|num| puts num}
 [1,2,3].my_each_with_index {|num, idx| puts "num is #{num} at index #{idx}"}

