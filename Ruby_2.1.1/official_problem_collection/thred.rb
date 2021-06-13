
p Thread.main
p Thread.list
p "Hello World"

Thread.new{"Good Evening"}
Thread.fork{"Good Morning"}

p Thread.list

def time1
    sleep(2)
    puts Time.now.strftime("%H時%M分%S秒")
end

def time2
    sleep(2)
    puts Time.now.strftime("%H時%M分%S秒")
end

time1 #=> 上から順に実行
time2

threads = []
threads << Thread.new{ time1() }
threads << Thread.fork{ time2() }

threads.each { |thr| thr.join} #=> time1とtime2を同時に実行