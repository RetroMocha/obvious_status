require_relative '../app/contracts/user_jack_contract'
require_relative 'user_plug_for_fs'

class UserJack

  def initialize
    @plug = UserPlugForFs.new
  end

  def list
    @plug.list
  end

  def get input
    @plug.get input
  end
end
