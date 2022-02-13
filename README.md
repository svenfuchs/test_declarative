# TestDeclarative

[![CI](https://github.com/svenfuchs/test_declarative/actions/workflows/ci.yml/badge.svg)](https://github.com/svenfuchs/test_declarative/actions/workflows/ci.yml)

Simply adds a declarative test method syntax to test/unit.

```ruby
require 'test_declarative'

class MyTest < Test::Unit::TestCase
  test "your test description" do
    # your test code
  end
end
```
