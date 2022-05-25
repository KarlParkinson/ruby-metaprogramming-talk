s = "hello"
puts s.upcase

class String
  def upcase
    # Uh oh, upcase now becomes downcase. Monkey patching can get you in trouble. Be careful.
    downcase
  end
end

puts s.upcase
