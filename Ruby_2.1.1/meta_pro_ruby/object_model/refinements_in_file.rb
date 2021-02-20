module StringExtensions
    refine String do
        def to_alphanumeric
            gsub(/[^\w\d]/,'')
        end
    end
end

#このままだと有効にならず　usingメソッドを使用する
using StringExtensions

p "My *first* ;Story".to_alphanumeric