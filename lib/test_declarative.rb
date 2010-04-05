module TestDeclarative
  def self.included(base)
    base.class_eval do
      def self.test(name, &block)
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
  end
end

classes = [Module]
classes << Test::Unit::TestCase     if defined?(Test::Unit::TestCase)
classes << MiniTest::Unit::TestCase if defined?(MiniTest::Unit::TestCase)

classes.each { |c| c.send(:include, TestDeclarative) }