ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "mocha/minitest"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

#START: new_helper_method
def assert_select_string(string, *selectors, &block)
  doc_root = Nokogiri::HTML::Document.parse(string).root
  assert_select(doc_root, *selectors, &block)
end
#END: new_helper_method