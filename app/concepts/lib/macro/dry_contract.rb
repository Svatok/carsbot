module Lib::Macro::DryContract
  def self.Build(**params)
    Lib::Macro::DryContract::Build.call(params)
  end

  def self.Validate
    Lib::Macro::DryContract::Validate.call
  end

  def self.Sync(**params)
    Lib::Macro::DryContract::Sync.call(params)
  end
end
