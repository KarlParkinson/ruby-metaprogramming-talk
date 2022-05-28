# class_eval and instance_eval are confusing

class Foo
end

# Creates an instance method to be called on Foo objects
Foo.class_eval do
  def method_a
    puts "method a on #{self}"
  end
end

# Creates a class method to be called on the Foo class
Foo.instance_eval do
  def method_a
    puts "method a on #{self}"
  end
end

Foo.new.method_a
Foo.method_a

f = Foo.new

# will add a new method to f, but not to other instances of Foo
class << f
  def method_b
    puts "method_b on #{self}"
  end
end

f.method_b


# Equivalent to
# class Foo
#   def self.method_b
#     puts "method b on #{self}"
#   end
# end
class Foo
  class << self
    def method_b
      puts "method_b on #{self}"
    end
  end
end

Foo.method_b
