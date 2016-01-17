ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def create_alert(category = nil, email = 'test@example.com')
    category ||= Admin::Alert.categories[:breakdown]

    Admin::Alert.create!(description: 'test ' * 25,
                         category: category,
                         email: email)
  end
end
