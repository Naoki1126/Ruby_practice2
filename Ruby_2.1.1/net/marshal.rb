str = Marshal.dump({:a => 1,:b => 2, :c => 3})
p str
p Marshal.load(str)

file = File.open("marshldata","w+")
Marshal.dump({:a => 1, :b => 2, :c => 3},file)

file.rewind

p Marshal.load(file)