require_relative '../../entities/user'

describe User do

  describe 'self.shape' do
    it 'should return the User object shape' do
      User.shape.should eq handle: String, id: Fixnum
    end
  end

  describe '#initialize' do
    it 'should populate with valid input' do
      input = { :handle => 'chef', :id => 1 }
      user = User.new input
      user.to_hash.should eq :handle => 'chef', :id => 1
    end

    it 'should raise an error with invalid input' do
      input = { :handle => nil, :id => nil }
      expect { User.new input }.to raise_error Obvious::TypeError
    end 
  end
   
end
