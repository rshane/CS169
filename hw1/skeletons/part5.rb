class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(value)
        @#{attr_name}=value
        if @#{attr_name}_history.nil?
          @#{attr_name}_history=[nil]
        end
        @#{attr_name}_history << value
      end
    }
  end
end

=begin
#TEST
class Cooties
  attr_accessor_with_history :bar
  attr_accessor_with_history :car
end

f = Cooties.new
puts f.bar_history.to_s
f.car = 1
f.bar = 2
f.car = :sam
f.bar = "alpha"
puts f.car_history.to_s
puts f.bar_history.to_s
class Foo
  attr_accessor_with_history :bar
  attr_accessor_with_history :star
end
f = Foo.new
f.bar = 1
f.star = 2

puts f.bar_history.inspect
puts f.star_history.inspect
=end
