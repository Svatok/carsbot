module Lib::Macro::DryContract::Build
  def self.call(constant:)
    step = ->(ctx, **) {
      ctx[:dry_contract] = constant.new
    }
    task = Trailblazer::Activity::TaskBuilder::Binary(step)
    { task: task, id: 'dry_schema.constant' }
  end
end
