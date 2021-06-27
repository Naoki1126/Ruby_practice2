# puts "create  thread"

# t = Thread.new do
#     puts "start thred"
#     sleep 3
#     puts "end Thred"
# end


# puts "wating for the thread to complete"

# t.join

# puts "complete"



# puts "create thread"

# t = Thread.new do
#     puts "start thread"
#     sleep 10
#     puts 'end thread'
# end

# Thread.kill(t)
# puts "the thread kill"


# puts 'create thread'

# t = Thread.new do
#     puts "start thread"
#     Thread.stop
#     puts "end thread"
# end


# gets
# t.run
# t.join

# puts "complete"


begin
    t = Thread.new do
        raise
    end

    # t.join
rescue
    p "例外が発生しました"
end