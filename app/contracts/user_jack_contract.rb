require 'obvious'
require_relative '../entities/user'

class UserJackContract < Obvious::Contract

  contract_for :save, {
    input: User.shape,
    output: User.shape
  }

  contract_for :get, {
    input: { id: Fixnum },
    output: User.shape
  }

  contract_for :list, {
    input: nil,
    output: [ User.shape ]
  }
end
