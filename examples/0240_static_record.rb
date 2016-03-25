# StaticRecord を Treeable 対応
require "bundler/setup"
require "tree_support"
require "static_record"

class Foo
  include StaticRecord
  static_record [
    {:key => :a, :name => "A", :parent => nil},
    {:key => :b, :name => "B", :parent => :a},
    {:key => :c, :name => "C", :parent => :b},
  ]

  # parent と children に反応できれば構造は何でもよい
  concerning :TreeMethods do
    included do
      include TreeSupport::Treeable
      include TreeSupport::Stringify
    end

    def parent
      self.class[@attributes[:parent]]
    end

    def children
      self.class.find_all {|e| e.parent == self }
    end
  end
end

puts Foo.find_all(&:root?).collect(&:to_s_tree)
# >> A
# >> └─B
# >>     └─C