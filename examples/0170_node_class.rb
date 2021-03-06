# -*- coding: utf-8 -*-
#
# Treeable モジュールが入っていると each_node が使える
#
require "bundler/setup"
require "tree_support"

root = TreeSupport.example
root.class.ancestors                  # => [TreeSupport::Node, TreeSupport::Stringify, TreeSupport::Treeable, Object, Kernel, BasicObject]
root.each_node.with_index {|n, i| p [i, n.name] }

# >> [0, "*root*"]
# >> [1, "交戦"]
# >> [2, "攻撃"]
# >> [3, "剣を振る"]
# >> [4, "攻撃魔法"]
# >> [5, "召喚A"]
# >> [6, "召喚B"]
# >> [7, "縦で剣をはじく"]
# >> [8, "防御"]
# >> [9, "撤退"]
# >> [10, "足止めする"]
# >> [11, "トラップをしかける"]
# >> [12, "弓矢を放つ"]
# >> [13, "逃走する"]
# >> [14, "休憩"]
# >> [15, "立ち止まる"]
# >> [16, "回復する"]
# >> [17, "回復魔法"]
# >> [18, "回復薬を飲む"]
