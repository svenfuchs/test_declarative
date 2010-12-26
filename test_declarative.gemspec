# encoding: utf-8

require File.expand_path('../lib/test_declarative/version', __FILE__)

Gem::Specification.new do |s|
  s.name         = 'test_declarative'
  s.version      = TestDeclarative::VERSION
  s.authors      = ['Sven Fuchs']
  s.email        = 'svenfuchs@artweb-design.de'
  s.homepage     = 'http://github.com/svenfuchs/test_declarative'
  s.summary      = 'Simply adds a declarative test method syntax to test/unit'
  s.description  = 'Simply adds a declarative test method syntax to test/unit.'
  s.files        = Dir['{lib/**/*,test/**/*,[A-Z]*}']

  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'
  s.required_rubygems_version = '>= 1.3.6'
end
