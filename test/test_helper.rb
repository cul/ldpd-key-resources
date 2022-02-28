ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

Capybara.configure do |config|
  config.enable_aria_label = true
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  def integration_test?
    self.is_a?(ActionDispatch::SystemTestCase) || self.is_a?(ActionDispatch::IntegrationTest)
  end

  def login_as_user(user)
    if integration_test?
      # use warden
      login_as(user, scope: :user)
    else
      # use devise
      sign_in(user)
    end
  end
end
