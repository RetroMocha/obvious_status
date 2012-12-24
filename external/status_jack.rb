require_relative '../app/contracts/status_jack_contract'

require_relative 'status_plug_for_fs'

class StatusJack < StatusJackContract
  def initialize
    @plug = StatusPlugForFs.new 
  end

  def list
    @plug.list
  end
end
