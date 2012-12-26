require_relative '../app/contracts/status_jack_contract'
require_relative 'fs_plug'
require_relative 'mysql_plug'

class StatusJack < StatusJackContract
  def initialize
    @plug = FsPlug.new 'data/stauses.json'
    @plug = MysqlPlug.new :statuses
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
