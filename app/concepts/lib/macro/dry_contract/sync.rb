module Lib::Macro::DryContract::Sync
  def self.call(save: false)
    step = ->(_ctx, model:, dry_contract:, **) {
      model.assign_attributes(dry_contract.validation.to_h)
      save ? model.save : true
    }
    task = Trailblazer::Activity::TaskBuilder::Binary(step)
    { task: task, id: 'dry_schema.sync' }
  end
end
