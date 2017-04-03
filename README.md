# TestDeclarative

[![Build Status](https://api.travis-ci.org/svenfuchs/test_declarative.svg?branch=master)](https://travis-ci.org/svenfuchs/test_declarative)

Simply adds a declarative test method syntax to test/unit.

```ruby
require 'test_declarative'

class MyTest < Test::Unit::TestCase
  test "your test description" do
    # your test code
  end
end
```
