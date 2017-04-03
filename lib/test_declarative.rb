targets = [Module]
targets << Test::Unit::TestCase     if defined?(Test::Unit::TestCase)
targets << MiniTest::Unit::TestCase if defined?(MiniTest::Unit::TestCase)
targets << Minitest::Test           if defined?(Minitest::Test)

targets.each do |target|
  target.class_eval do
    def test(name, &block)
      test_name = "test_#{name.gsub(/\s+/,'_')}".to_sym
      defined = instance_method(test_name) rescue false
      raise "#{test_name} is already defined in #{self}" if defined
      if block_given?
        define_method(test_name, &block)
      else
        define_method(test_name) do
          flunk "No implementation provided for #{name}"
        end
      end
    end
  end
  
  target.instance_eval do
    alias :orig_test_methods :test_methods
    
    def test_methods
      methods = orig_test_methods
      methods.delete('test')
      methods
    end
  end if target.respond_to?(:test_methods)
end
