require_relative '../app/contracts/user_jack_contract'
require_relative 'fs_plug'

class UserJack

  def initialize
    @plug = FsPlug.new 'data/users.json'
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
