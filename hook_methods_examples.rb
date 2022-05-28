module Foo
  def self.included(included_in)
    puts "I was included in #{included_in}"
  end

  def self.extended(extended_by)
    puts "I was extended by #{extended_by}"
  end

  def self.prepended(prepended_by)
    puts "I was prepended by #{prepended_by}"
  end
end

class Bar
  include Foo

  def self.inherited(sub_klass)
    puts "I was inherited by #{sub_klass}"
  end
end

class FooBar
  prepend Foo
end

class BarFoo
  extend Foo
end

class ChildBar < Bar
end
