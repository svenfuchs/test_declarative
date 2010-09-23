$: << File.expand_path('../../lib', __FILE__)

require 'test/unit'
require 'test_declarative'

class TestDeclarativeTest < Test::Unit::TestCase
  def test_responds_to_test
    assert self.class.respond_to?(:test)
  end
  
  def test_adds_a_test_method
    called = false
    assert_nothing_raised { Test::Unit::TestCase.test('some test') { called = true } }
    Test::Unit::TestCase.new(:'test_some_test').run((RUBY_VERSION < '1.9.1' ? Test::Unit::TestResult : MiniTest::Unit).new) {}
    assert called
  end
end