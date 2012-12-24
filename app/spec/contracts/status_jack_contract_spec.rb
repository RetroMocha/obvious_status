require_relative '../../contracts/status_jack_contract'
require_relative '../doubles/status_jack_double'

describe StatusJackContract do

  describe '.save_contract' do
    it 'should save data with valid input' do
      input = { :user_id => 1, :text => 'making a sandwich', :id => 1 }
      jack = StatusJackDouble.create :default
      result = jack.save input
      result.should eq :user_id => 1, :text => 'making a sandwich', :id => 1
    end

    it 'should raise an error with invalid input' do
      input = { :user_id => nil, :text => nil, :id => nil }
      jack = StatusJackDouble.create :default
      expect { jack.save input }.to raise_error ContractInputError
    end

    it 'should raise an error with invalid output' do
      input = { :user_id => 1, :text => 'making a sandwich', :id => 1 }
      jack = StatusJackDouble.create :bad_output
      expect { jack.save input }.to raise_error ContractOutputError
    end

  end
    
  describe '.get_contract' do
    it 'should get data with valid input' do
      input = { :id => 1 }
      jack = StatusJackDouble.create :default
      result = jack.get input
      result.should eq :user_id => 1, :text => 'making a sandwich', :id => 1
    end

    it 'should raise an error with invalid input' do
      input = { :id => nil }
      jack = StatusJackDouble.create :default
      expect { jack.get input }.to raise_error ContractInputError
    end

    it 'should raise an error with invalid output' do
      input = { :id => 1 }
      jack = StatusJackDouble.create :bad_output
      expect { jack.get input }.to raise_error ContractOutputError
    end

  end
    
  describe '.list_contract' do
    it 'should list data with valid input'

    it 'should raise an error with invalid input'

    it 'should raise an error with invalid output'

  end
    
  describe '.remove_contract' do
    it 'should remove data with valid input'

    it 'should raise an error with invalid input'

    it 'should raise an error with invalid output'

  end
     
end

