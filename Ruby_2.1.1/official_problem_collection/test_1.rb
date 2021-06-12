1: 1,2 ×1,4

2: 1 
3: 1,3
4: 2
5: 1
6: 2,4 × 1,2,4
7: 1,2,4 ×1,4
8: 2
9: 3
10: 3
11: 2 ×4
12: 1
13: 2
14: 1
15: 1 ×3
16: 2 ×3
17: 2
18: 2,3,4
19: 1 ×2
20: 3 ×4
21: 2,4
22: 2 ×4
23: 1,2,4
24: 3
25: 2
26: 4 ×1
27:  ×2,4,5
28: 1 ×4
29: 2,5 ×1,2,5
30: 1












# x,y = 1,2
# p x
# p y

# y = *[1,2,3]
# p y

# x, *y = *[0,1,2]
# p x,y

x = 0,1,2
p x.class

x = *[1,2,3]
p x.class

class Err1 < StandardError; end
class Err2 < Err1; end
begin
    raise Err1
rescue => e
    puts e.class
    puts "StandardError"
rescue Err2 => ex
    puts ex.class
end


