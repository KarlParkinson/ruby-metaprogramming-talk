class Foo
  def method_missing(method, *args, &block)
    puts "method #{method} does not exist."
  end
end

class Bar
  def method_missing(method, *args, &block)

  end
end

Foo.new.do_something
