$: << File.expand_path('../../lib', __FILE__)

require 'test/unit'
require 'test_declarative'

class TestDeclarativeTest < Test::Unit::TestCase
  def test_responds_to_test
    assert self.class.respond_to?(:test)
  end
  
  def test_adds_a_test_method
    self.class.test('foo')
    self.respond_to?(:'test_foo')
  end
end