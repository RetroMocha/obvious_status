require_relative '../app/contracts/status_jack_contract'
require_relative 'fs_plug'

class StatusJack < StatusJackContract
  def initialize
    @plug = FsPlug.new 'data/statuses.json'
  end

  def list
    @plug.list
  end

  def get input
    @plug.get input
  end

  def save input
    @plug.save input
  end

  def remove input
    @plug.remove input
  end
end
