require 'pry'
pry = Pry.new
pry.memory_size = 101
pry.memory_size #=> 101
pry.quiet = true

# pry のインスタンスを設定する pry#refresh

pry.refresh(:memory_size => 99, :quiet => false )
pry.memory_size #=> 99
pry.quiet #=> false

