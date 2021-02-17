module MyModule
    MyConstant = '外側の定数'

    class MyClass
        MyConstant = '内側の定数'
    end
end

#これは同じものではない

module M
    class C
        X = 'ある変数'
    end

    C::X #=> ある定数
end

M::C::X #=> ある定数

Y = 'ルートレベルの定数'

module M
    Y = 'Mにある定数'
    Y #=> "Mにある定数"
    ::Y #=> ルートレベルの定数
end

M.constants #=> [:C, :Y]
Module.constants.include? :object #=>

module M
    class C
        module M2
            Module.nesting #=> [M::C::M2, M::C,M]
        end
    end
end

