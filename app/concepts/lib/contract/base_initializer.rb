class Lib::Contract::BaseInitializer
  extend Dry::Initializer

  attr_reader :validator, :validation

  def initialize(*args)
    super(*args)
    @validator = "#{self.class.parent}::Validator".constantize.new
  end

  def validate
    @validation = validator.call(self.class.dry_initializer.public_attributes(self))
  end
end
