module Lib::Macro::DryContract::Validate
  def self.call
    step = ->(_ctx, dry_contract:, **) {
      dry_contract.validate
      dry_contract.validation.success?
    }
    task = Trailblazer::Activity::TaskBuilder::Binary(step)
    { task: task, id: 'dry_schema.validate' }
  end
end
