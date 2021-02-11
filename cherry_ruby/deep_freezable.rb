module DeepFreezable
    def deep_freeze(array_or_hash)
        case array_or_hash
            when Array
                #配列の各要素をfreeze
                array_or_hash.each do |element|
                    element.freeze
                end
            when Hash
                #ハッシュの各要素をfreeze
                array_or_hash.each do |key,value|
                    key.freeze
                    value.freeze
                end
            end

        #配列orハッシュ自身をfreeze (かつ、これがメソッドの戻り値になる)
        array_or_hash.freeze
    end
end