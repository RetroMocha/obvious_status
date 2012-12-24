require_relative '../../contracts/user_jack_contract'
require_relative '../doubles/user_jack_double'

describe UserJackContract do

  describe '.save_contract' do
    it 'should save data with valid input' do
      input = { :id => 1, :handle => 'chef' }
      jack = UserJackDouble.create :default
      result = jack.save input
      result.should eq :id => 1, :handle => 'chef'
    end

    it 'should raise an error with invalid input' do
      input = { :id => nil, :handle => nil }
      jack = UserJackDouble.create :default
      expect { jack.save input }.to raise_error ContractInputError 
    end

    it 'should raise an error with invalid output' do
      input = { :id => 1, :handle => 'chef' }
      jack = UserJackDouble.create :bad_output
      expect { jack.save input }.to raise_error ContractOutputError 
    end

  end
    
  describe '.get_contract' do
    it 'should get data with valid input' do
      input = { :id => 1 }
      jack = UserJackDouble.create :default
      result = jack.get input
      result.should eq :id => 1, :handle => 'chef'
    end

    it 'should raise an error with invalid input' do
      input = { :id => nil }
      jack = UserJackDouble.create :default
      expect { jack.get input }.to raise_error ContractInputError 
    end

    it 'should raise an error with invalid output' do
      input = { :id => 1 }
      jack = UserJackDouble.create :bad_output
      expect { jack.get input }.to raise_error ContractOutputError 
    end 
  end
     
end

