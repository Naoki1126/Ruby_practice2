# test = "aaaaaa"
# puts test;

# class Klass
#     @class_instance_val = :class_instance_val
#     @@class_val = "Class_value"
#     def self.class_instance_val
#         @class_instance_val
#     end

#     def instance_method
#         @class_instance_val
#     end

#     def class_val
#         @@class_val
#     end

#     def reflection
#         self.class.instance_variable_get(:@class_instance_val)
#     end
# end

# puts Klass.class_instance_val
# puts Klass.instance_variable_get(:@class_instance_val)
# puts Klass.new.instance_method #=> nil
# puts Klass.new.class_val
# puts Klass.new.reflection

# class InstanceCountClass

#     @@instance_count = 0

#     def self.instance_count
#         @@instance_count
#     end

#     def initialize
#         @@instance_count += 1
#     end
# end

# puts InstanceCountClass.instance_count #=> 0

# 5.times do
#     InstanceCountClass.new
# end

# puts InstanceCountClass.instance_count

# class NewInstanceCountClass < InstanceCountClass
# end


# NewInstanceCountClass.instance_count
# 5.times do 
#     NewInstanceCountClass.new
# end

# p InstanceCountClass.instance_count #=10
# p NewInstanceCountClass.instance_count #=> 10

class InstanceCountClass
    @instance_count = 0

    def self.instance_count_up
        @instance_count += 1 if @instance_count
    end

    def self.instance_count_up
        @instance_count
    end

    def initialize
        self.class.instance_count_up
    end
end

5.times do
    InstanceCountClass.new
end