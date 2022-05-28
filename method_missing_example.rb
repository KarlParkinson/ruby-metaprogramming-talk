class Foo
  def method_missing(method, *args, &block)
    puts "method #{method} does not exist."
  end
end

class Bar
  # Can create method on the fly at runtime using method_missing and define_method
  def method_missing(method, *args, &block)
    self.class.send(:define_method, method) do
      puts "Created a method called #{method}!"
    end
    self.send(method, *args, &block)
  end
end

Foo.new.do_something
Bar.new.do_something
Bar.new.do_something_else
