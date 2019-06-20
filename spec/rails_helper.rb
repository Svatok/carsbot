require 'simplecov'

SimpleCov.minimum_coverage(100)

if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?

# Add additional requires below this line. Rails is not loaded until this point!
require 'rspec/rails'
require 'spec_helper'
require 'support/helpers'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Sync FFaker random values with Rspec seed option (to capture random failing tests).
  config.before(:all)  { FFaker::Random.seed = config.seed }
  config.before(:each) { FFaker::Random.reset! }

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  config.include Helpers

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!

  # To generate apipie examples use APIPIE_RECORD=examples rspec spec/controllers
  config.filter_run show_in_doc: true if ENV['APIPIE_RECORD']
end

RSpec::Matchers.define_negated_matcher :not_change, :change

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
