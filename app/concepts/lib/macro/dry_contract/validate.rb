module Lib::Macro::DryContract::Validate
  def self.call
    step = ->(ctx, params:, dry_contract:, **) {
      ctx[:'dry_contract.result'] = dry_contract.call(params)
      ctx[:'dry_contract.result'].success?
    }
    task = Trailblazer::Activity::TaskBuilder::Binary(step)
    { task: task, id: 'dry_schema.validate' }
  end
end
