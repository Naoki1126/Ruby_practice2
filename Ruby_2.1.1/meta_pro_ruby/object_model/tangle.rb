module Printtable
    def print
        puts "print in printtable"
    end

    def prepare_cover
        puts "prepare_cover in printtable"
    end
end

module Document

    def print_to_screen
       prepare_cover
       format_for_screen
       print
    end

    def format_for_screen
        puts "format_for_screen in document"
    end

    def print
        puts "print in document"
    end
end

class Book
    include Document
    include Printtable
end


b = Book.new
p b.print_to_screen

#=> prepare_cover in printtable
#=> format_for_screen in document
#=> print in printtable
#=> nil

p Book.ancestors #=> [Book, Printtable, Document, Object, Kernel, BasicObject]

class ChangeBook
    prepend Document
    include Printtable
end

cb = ChangeBook.new
p cb.print_to_screen

#=> prepare_cover in printtable
#=> format_for_screen in document
#=> print in document
# nil

p ChangeBook.ancestors
#=> [Document, ChangeBook, Printtable, Object, Kernel, BasicObject]