def method_1
    puts "method_1 start"

    begin 
        method_2
    rescue
        puts "例外が発生"
    end
    puts "method_1 end"
end


def method_2
    puts "method_2_start"
    puts "method_2_end"
end

def method_3
    puts "method_3_start"
    1 / 0
    puts "method_3_end"
end

method_1
