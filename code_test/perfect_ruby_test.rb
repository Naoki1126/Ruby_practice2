# class Klass
#     define_method "test_method",Proc.new{|a| puts "aaaaaa"}
#     define_method :instance_method, -> { :instance_method } #動的なメソッド定義、第一にメソッド名をシンボルもしくは文字列、第二引数にProcオブジェクト
# end

# object = Klass.new
# p object.instance_method
# p object.test_method("aaa")


module IncludedModule
    def included_module_method
        :included_module_method
    end
end

class Klass
    include IncludedModule

    define_method :included_module_method,
        IncludedModule.instance_method(:included_module_method)
end

object = Klass.new
p object.included_module_method
