require './methods.rb'

array_1 = [1, 2, 3]
describe Enumerable do
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
end