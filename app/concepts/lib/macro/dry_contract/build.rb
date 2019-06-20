module Lib::Macro::DryContract::Build
  def self.call(constant:)
    step = ->(ctx, params:, **) {
      ctx[:dry_contract] = constant.new(params.deep_symbolize_keys)
    }
    task = Trailblazer::Activity::TaskBuilder::Binary(step)
    { task: task, id: 'dry_schema.constant' }
  end
end
