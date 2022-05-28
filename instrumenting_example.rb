require 'set'

module Instrument
  def self.included(klass)
    klass.class_eval do
      def self.instrumented_methods
        @instrumented_methods ||= Set.new
      end

      def self.method_added(method)
        return if instrumented_methods.include?(method) || method.to_s =~ /^instrumented_\w+/

        instrumented_methods << method

        alias_method "instrumented_#{method}", method
        self.send(:define_method, method) do
          start = Time.now
          send("instrumented_#{method}")
          finish = Time.now
          run_time = finish - start
          puts "#{method} took #{run_time.to_s} seconds"
        end

      end
    end
  end
end

class Foo
  include Instrument

  def method_a
    puts "doing three seconds worth of computations"
    sleep 3
  end

  def method_b
    puts "doing five seconds worth of computations"
    sleep 5
  end
end

Foo.new.method_a
Foo.new.method_b
