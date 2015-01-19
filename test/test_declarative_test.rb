$: << File.expand_path('../../lib', __FILE__)

# Test with test/unit for older Rubies
begin
  require 'test/unit'
  require 'test/unit/testresult'
  if RUBY_VERSION < '1.9.1'
    # test/unit
    TEST_CASE = Test::Unit::TestCase
    RUNNER = Test::Unit::TestResult
    MINITEST_5 = false
  else
    # Minitest < 5
    TEST_CASE = Test::Unit::TestCase
    RUNNER = MiniTest::Unit
    MINITEST_5 = false
  end
rescue LoadError, StandardError
  # Minitest >= 5
  require 'minitest/autorun'
  TEST_CASE = Minitest::Test
  RUNNER = Minitest::Unit
  MINITEST_5 = true
end

require 'test_declarative'

class TestDeclarativeTest < TEST_CASE
  def test_responds_to_test
    assert self.class.respond_to?(:test)
  end
  
  def test_adds_a_test_method
    called = false
    TEST_CASE.test('some test') { called = true }
    case MINITEST_5
    when false
      TEST_CASE.new(:'test_some_test').run(RUNNER.new) {}
    when true
      TEST_CASE.new(:'test_some_test').run() {}
    end
    assert called
  end
end
