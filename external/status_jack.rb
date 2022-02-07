require_relative '../app/contracts/status_jack_contract'
require_relative 'fs_plug'
require_relative 'mysql_plug'

class StatusJack < StatusJackContract
  def initialize plug = nil
    case plug
    when :fs
      @plug = FsPlug.new 'data/statuses.json'
    when :mysql
      @plug = MysqlPlug.new :statuses
    when :mongo
      @plug = MongoPlug.new :statuses
    when :api
      @plug = ApiPlug.new :status
    else
      @plug = FsPlug.new 'data/statuses.json'
    end
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
