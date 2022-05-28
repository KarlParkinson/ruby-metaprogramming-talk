class Foo

  def method_a
    puts "method a"
  end

end

puts Foo.new.respond_to?("method_a") # true
puts Foo.new.respond_to?("method_b") # false
