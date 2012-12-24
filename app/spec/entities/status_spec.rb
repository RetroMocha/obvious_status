require_relative '../../entities/status'

describe Status do

  describe '.populate' do
    it 'should populate with valid input' do
      input = { :id => 1, :user_id => 1, :text => 'making a sandwich' }
      status = Status.new
      status.populate input
      status.to_hash.should eq :id => 1, :user_id => 1, :text => 'making a sandwich'
    end

    it 'should raise an error with invalid input' do
      input = { :id => nil, :user_id => nil, :text => nil } # should test other variations, but this is just an example
      status = Status.new
      expect { status.populate input }.to raise_error Validation::InvalidWritingError
    end

  end
    
  describe '.to_hash' do
    it 'should to_hash with valid input' do
      input = { :id => 1, :user_id => 1, :text => 'making a sandwich' }
      status = Status.new
      status.populate input
      status.to_hash.should eq :id => 1, :user_id => 1, :text => 'making a sandwich'
    end

  end
    
end


