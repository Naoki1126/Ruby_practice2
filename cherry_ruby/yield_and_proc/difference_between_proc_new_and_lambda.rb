def proc_return
    # Proc.newでreturnを使う
    f = Proc.new { |n| return n * 10}
    ret = [1,2,3].map(&f)
    "ret: #{ret}"
end

def lambda_return
    # ラムダでreturnを使う
    f = ->(n) { return n * 10 }
    ret = [1,2,3].map(&f)
    "ret: #{ret}"
end

proc_return #=> 10 Procだと処理を抜ける
lambda_return #=> "ret: [10, 20, 30]" lambdaは抜けない

def proc_break
    # Proc.newでbreakを使う
    f = Proc.new{ |n| break n * 10 }
    ret = [1,2,3].map(&f)
    "ret: #{ret}"
end

def lambda_return
    # ラムダでbreakを使う
    f = ->(n) { break n * 10 }
    ret = [1,2,3].map(&f)
    "ret: #{ret}"
end

proc_break #=> LocalJumpError: break from proc-closure Procだと例外が発生する
lambda_break #=> "ret: [10, 20, 30]" lambdaだと処理を続行する


