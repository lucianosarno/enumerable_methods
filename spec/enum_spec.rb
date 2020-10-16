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
      array_2_expected = {"cat"=>0, "dog"=>1, "wombat"=>2}
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
    it '[:foo, :bar].filter { |x| x == :foo }   #=> [:foo]' do
      expect(%i[foo bar].my_select { |x| x == :foo  }).to eql([:foo])
    end
  end
  describe '#my_all?' do
    it '%w[ant bear cat].my_all? { |word| word.length >= 3 } return true' do
      expect(str_arr.my_all? { |word| word.length >= 3 }).to eql(true)
    end
    it '%w[ant bear cat].all? { |word| word.length >= 4 } return false' do
      expect(str_arr.all? { |word| word.length >= 4 }).to eql(false)
    end
    it '%w[ant bear cat].all?(/t/) returns false' do
      expect(str_arr.my_all?(/t/)).to eql(false)
    end
    it '[1, 2i, 3.14].all?(Numeric) returns true ' do
      expect([1, 2i, 3.14].all?(Numeric)).to eql(true)
    end
    it '[].all? returns true ' do
      expect([].all? ).to eql(true)
    end
    it '[nil, true, 99].all?  returns false' do
      expect([nil, true, 99].all? ).to eql(false)
    end
  end
end
