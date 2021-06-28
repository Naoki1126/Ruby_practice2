VAR = "main"


module MyModule
    puts VAR + " main1"
    puts ::VAR + " main2"

    VAR = "MyModule"
    puts VAR + " module1"
    puts ::VAR + " main3"
end


class MyClass
    puts VAR + " main1@MyClass"

    VAR = "MyClass"
    puts VAR + "MyClass1@my_method"

    def my_method
        puts VAR + "MyClass3@my_method"
        puts MyClass::VAR + "MyClass4@my_method"
    end

    include MyModule
    puts VAR + "MyClass2@MyClass"
    puts MyModule::VAR + "MyModule1@Myclass"
end

mc = MyClass.new
mc.my_method
