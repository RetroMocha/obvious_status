require_relative '../app/contracts/user_jack_contract'
require_relative 'fs_plug'
require_relative 'mysql_plug'
require_relative 'mongo_plug'

class UserJack

  def initialize plug = nil
    case plug
    when :fs 
      @plug = FsPlug.new 'data/users.json'
    when :mysql
      @plug = MysqlPlug.new :users
    when :mongo
      @plug = MongoPlug.new :users
    when :api
      @plug = ApiPlug.new :user
    else
      @plug = FsPlug.new 'data/users.json' 
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
