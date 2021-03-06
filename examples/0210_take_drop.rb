# -*- coding: utf-8 -*-
require "bundler/setup"
require "tree_support"
puts "--------------------------------------------------------------------------------"
puts TreeSupport.example.to_s_tree(:drop => 3)
puts "--------------------------------------------------------------------------------"
puts TreeSupport.example.to_s_tree(:take => 3)
puts "--------------------------------------------------------------------------------"
puts TreeSupport.example.to_s_tree(:take => 3, :drop => 1)
# >> --------------------------------------------------------------------------------
# >> 剣を振る
# >> 攻撃魔法
# >> ├─召喚A
# >> └─召喚B
# >> 縦で剣をはじく
# >> トラップをしかける
# >> 弓矢を放つ
# >> 回復魔法
# >> 回復薬を飲む
# >> --------------------------------------------------------------------------------
# >> *root*
# >> ├─交戦
# >> │   ├─攻撃
# >> │   └─防御
# >> ├─撤退
# >> │   ├─足止めする
# >> │   └─逃走する
# >> └─休憩
# >>     ├─立ち止まる
# >>     └─回復する
# >> --------------------------------------------------------------------------------
# >> 交戦
# >> ├─攻撃
# >> └─防御
# >> 撤退
# >> ├─足止めする
# >> └─逃走する
# >> 休憩
# >> ├─立ち止まる
# >> └─回復する
