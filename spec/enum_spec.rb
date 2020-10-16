require './methods.rb'

array_1 = [1, 2, 3]
describe Enumerable do
  let(:str_arr){ %w[ant bear cat] }

  describe '#my_each' do
    it '[1, 2, 3].each_cons(3) { |a| a } should return [1, 2, 3]' do
      expect(array_1.my_each { |a| a }).to eql([1, 2, 3])
    end
  end

  describe '#my_each_with_index' do
 
    it '%w(cat dog wombat).my_each_with_index { |item, index| hash[item] = index } should return {"cat"=>0, "dog"=>1, "wombat"=>2}' do
      array_2 = ['cat', 'dog', 'wombat']
      array_2_expected = {'cat'=>0, "dog"=>1, "wombat"=>2}
      hash_new = Hash.new
      array_2.my_each_with_index { |item, index|
        hash_new[item] = index
      } 
      expect(hash_new).to eql(array_2_expected)
    end
  end  
  describe '#my_select' do
    it '[1,2,3,4,5].my_select { |num|  num.even?  }  should return [2, 4]' do
      expect([1, 2, 3, 4, 5].my_select { |num| num.even?}).to eql([2, 4])
    end
    it '(1..10).my_select { |i|  i % 3 == 0 }   #=> [3, 6, 9]' do
      expect((1..10).my_select { |i| i % 3 == 0 }).to eql([3, 6, 9])
    end
    it '[:foo, :bar].my_select { |x| x == :foo }   #=> [:foo]' do
      expect(%i[foo bar].my_select { |x| x == :foo  }).to eql([:foo])
    end
  end
  describe '#my_all?' do
    it '%w[ant bear cat].my_all? { |word| word.length >= 3 } return true' do
      expect(str_arr.my_all? { |word| word.length >= 3 }).to eql(true)
    end
    it '%w[ant bear cat].my_all? { |word| word.length >= 4 } return false' do
      expect(str_arr.my_all? { |word| word.length >= 4 }).to eql(false)
    end
    it '%w[ant bear cat].my_all?(/t/) returns false' do
      expect(str_arr.my_all?(/t/)).to eql(false)
    end
    it '[1, 2i, 3.14].my_all?(Numeric) returns true ' do
      expect([1, 2i, 3.14].my_all?(Numeric)).to eql(true)
    end
    it '[].my_all? returns true ' do
      expect([].my_all? ).to eql(true)
    end
    it '[nil, true, 99].my_all?  returns false' do
      expect([nil, true, 99].my_all? ).to eql(false)
    end
  end
  describe '#my_any?' do
    it '%w[ant bear cat].my_any? { |word| word.length >= 3 } return true' do
      expect(str_arr.my_any? { |word| word.length >= 3 }).to eql(true)
    end  
    it '%w[ant bear cat].my_any? { |word| word.length >= 4 } return true' do
      expect(str_arr.my_any? { |word| word.length >= 4 }).to eql(true)
    end 
    it '%w[ant bear cat].my_any?(/d/) returns false' do
      expect(str_arr.my_any?(/d/)).to eql(false)
    end    
    it '[nil, true, 99].my_any?(Integer)  returns true' do
      expect([nil, true, 99].my_any?(Integer) ).to eql(true)
    end    
    it '[nil, true, 99].my_any? returns true' do
      expect([nil, true, 99].my_any?).to eql(true)
    end  
    it '[].my_any? returns true ' do
      expect([].my_any?).to eql(false)
    end     
  end
  describe '#my_none' do
    it '%w[ant bear cat].my_none? { |word| word.length == 5} return true' do
      expect(str_arr.my_none? { |word| word.length == 5 }).to eql(true)
    end  
    it '%w[ant bear cat].my_none? { |word| word.length >= 4} return false' do
      expect(str_arr.my_none? { |word| word.length >= 4}).to eql(false)
    end      
    it '%w[ant bear cat].my_none?(/d/) returns true' do
      expect(str_arr.my_none?(/d/)).to eql(true)
    end
    it '[1, 3.14, 42].my_none?(Float) returns false' do
      expect([1, 3.14, 42].my_none?(Float)).to eql(false)
    end
    it '[].my_none? returns true' do
      expect([].my_none?).to eql(true)
    end
    it '[nil].my_none? returns true' do
      expect([nil].my_none?).to eql(true)
    end 
    it '[nil, false].my_none? returns true' do
      expect([nil, false].my_none?).to eql(true)
    end 
    it '[nil, false, true].my_none? returns false' do
      expect([nil, false, true].my_none?).to eql(false)
    end 
  end
  describe '#my_count' do
    ary = [1, 2, 4, 2]  
    it '[1, 2, 4, 2].my_count returns 4' do
      expect(ary.my_count).to eql(4)
    end
    it '[1, 2, 4, 2].my_count(2) returns 2' do
      expect(ary.my_count(2)).to eql(2)
    end 
    it '[1, 2, 4, 2].my_count { |x| x%2==0 } returns 3' do
      expect(ary.my_count { |x| x%2==0 }).to eql(3)
    end  
  end
  describe '#my_map' do
    it '(1..4)).my_map { |i| i*i }  returns [1, 4, 9, 16]' do
      expect((1..4).my_map { |i| i*i }).to eql([1, 4, 9, 16])
    end 
    it "(1..4)).my_map { 'cat' }  returns ['cat', 'cat', 'cat', 'cat']" do
      expect((1..4).my_map { 'cat' }).to eql(['cat', 'cat', 'cat', 'cat'])
    end
  end
  describe '#my_inject' do
    it '(5..10).my_inject(:+)  returns 45' do
      expect((5..10).my_inject(:+)).to eql(45)
    end 
    it '(5..10).my_inject{ |sum, n| sum + n }  returns 45' do
      expect((5..10).my_inject { |sum, n| sum + n } ).to eql(45)
    end 
    it '(5..10).my_inject(1, :*) returns 151200' do
      expect((5..10).my_inject(1, :*)).to eql(151200)
    end 
    it '(5..10).my_inject(1) { |product, n| product * n } returns 151200' do
      expect((5..10).my_inject(1) { |product, n| product * n }).to eql(151200)
    end 
    it '# find the longest word in %w{ cat sheep bear }' do
      longest = %w{ cat sheep bear }.inject do |memo, word|
        memo.length > word.length ? memo : word
      end
      expect(longest).to eql('sheep')
    end            
  end
  describe 'multiply_els' do
    it 'multiply_els(nil) returns "NoArrayGiven"' do
      puts "multiply_els(nil) #{multiply_els(nil)}"
      expect(multiply_els(nil)).to eql("NoArrayGiven")
    end     
  end

end
