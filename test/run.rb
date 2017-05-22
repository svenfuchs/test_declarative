#!/usr/bin/env ruby

require 'fileutils'

gemfiles = [
  'Gemfile',
  'gemfiles/Gemfile.minitest4',
  'gemfiles/Gemfile.unit-test'
]

version = RUBY_VERSION.split('.').map(&:to_i)
gemfiles << 'gemfiles/Gemfile.empty' if (version <=> [2, 2, 0]) < 0

is_ok = true
gemfiles.each do |gemfile|
  puts "Testing with gemfile: #{gemfile} ..."
  `rm -rf  ".bundle" \
    "Gemfile.lock" \
    "vendor" \
    "gemfiles/.bundle" \
    "gemfiles/Gemfile*.lock" \
    "gemfiles/vendor" || true`
  cmd = <<-EOF
    export BUNDLE_GEMFILE=#{gemfile} && \
    bundle install --path vendor/bundle && \
    bundle exec rake
EOF
  is_ok = false unless system(cmd)
end

# Use abort instead of exit for JRuby environment.
abort 'Tests failed' unless is_ok
