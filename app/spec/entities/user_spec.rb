require_relative '../../entities/user'

describe User do

  describe '.populate' do
    it 'should populate with valid input' do
      input = { :handle => 'chef', :id => 1 }
      user = User.new
      user.populate input
      user.to_hash.should eq :handle => 'chef', :id => 1
    end

    it 'should raise an error with invalid input' do
      input = { :handle => nil, :id => nil }
      user = User.new
      expect { user.populate input }.to raise_error Validation::InvalidWritingError
    end

  end
    
  describe '.to_hash' do
    it 'should to_hash with valid input' do
      input = { :handle => 'chef', :id => 1 }
      user = User.new
      user.populate input
      user.to_hash.should eq :handle => 'chef', :id => 1
    end

  end
    
end


