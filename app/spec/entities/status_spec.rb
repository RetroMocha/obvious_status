require_relative '../../entities/status'

describe Status do

  describe 'self.shape' do
    it 'should return the Status object shape' do
      Status.shape.should eq text: String, user_id: Fixnum, id: Fixnum
    end
  end

  describe '#initialize' do
    it 'should populate with valid input' do
      input = { :id => 1, :user_id => 1, :text => 'making a sandwich' }
      status = Status.new input
      status.to_hash.should eq :id => 1, :user_id => 1, :text => 'making a sandwich'
    end

    it 'should raise an error with invalid input' do
      input = { :id => nil, :user_id => nil, :text => nil } # should test other variations, but this is just an example
      expect { Status.new input }.to raise_error Obvious::TypeError
    end 
  end
   
end


