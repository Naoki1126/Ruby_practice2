# p (1..10).inject(0) do |sum,i|
#     sum + 1
# end

# do end  よりpの方が結合度が高く p (1..10).inject(0)が優先的に評価されるためエラーになる

# p (1..10).inject(0){|sum,i|
#     sum + 1
# }

# #{}だとinject(0)と{}の結合度が強く、正しく解釈されるため、問題ない

# #{}の前の引数には()を明示的に与える
# #  3.downto 0 { |i| puts i}
# #0の引数がブロックだと解釈される

# 3.downto 0 do |i| puts i end
# 3.downto(0) do |i| puts i end
# 3.downto(0){ |i| puts i}

# class MyError1 < StandardError
# end

# begin
#     raise MyError1
# rescue => e
#     puts "StanrdadError"
#     puts e.class
# end


# class MyError2 < Exception; end

# begin
#     raise MyError2
# rescue => e
#     puts "Exception"
# #     # p e.class
# # end


# begin
#     exit!
# rescue SystemExit
#     puts "SystemExit"
# # end


# begin
#     @user.name
# rescue NoMethodError
#     puts "aaaa"
# end


# @user.name rescue puts "Unknown"


catch :label do
    0.upto(2) do |x|
        0.upto(2) do |y|
            puts "x=#{x}, y=#{y}"
            throw :label if y==1
        end
    end
end