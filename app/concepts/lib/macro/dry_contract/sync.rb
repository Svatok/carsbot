module Lib::Macro::DryContract::Sync
  def self.call(save: false)
    step = ->(ctx, model:, **) {
      model.assign_attributes(ctx[:'dry_contract.result'].to_h)
      save ? model.save : true
    }
    task = Trailblazer::Activity::TaskBuilder::Binary(step)
    { task: task, id: 'dry_schema.sync' }
  end
end
