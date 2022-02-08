require 'obvious'
require_relative '../entities/status'

class StatusJackContract < Obvious::Contract
  contract_for :save, {
    input: Status.shape,
    output: Status.shape
  }

  contract_for :get, {
    input: { id: Integer },
    output: Status.shape
  }

  contract_for :list, {
    input: nil,
    output: [ Status.shape ]
  }

  contract_for :remove, {
    input: { id: Integer },
    output: true
  }
end
