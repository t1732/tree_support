# -*- coding: utf-8 -*-
#
# ノードの例
#
require "../lib/tree_support"

class Node
  attr_accessor :parent, :children # 親と子たち(TreeSupport.treeを使うには必須)

  attr_accessor :name

  def initialize(name, &block)
    @name = name
    @children = []
    if block_given?
      instance_eval(&block)
    end
  end

  # 木を簡単につくるため
  def add(*args, &block)
    tap do
      node = self.class.new(*args)
      node.parent = self
      @children << node
      if block_given?
        node.instance_eval(&block)
      end
    end
  end
end

root = Node.new("<root>") do
  add "交戦" do
    add "攻撃" do
      add "剣を振る"
      add "攻撃魔法" do
        add "召喚A"
        add "召喚B"
      end
      add "縦で剣をはじく"
    end
    add "防御"
  end
  add "撤退" do
    add "足止めする" do
      add "トラップをしかける"
      add "弓矢を放つ"
    end
    add "逃走する"
  end
  add "休憩" do
    add "立ち止まる"
    add "回復する" do
      add "回復魔法"
      add "回復薬を飲む"
    end
  end
end

# TreeSupport.tree に渡すオブジェクトは は parent.children と to_s_tree に応答できれば何でもいい
puts TreeSupport.tree(root)

# オブジェクト自体に tree メソッドを持たせたければ
Node.send(:include, TreeSupport::Model)
puts root.tree
# >> <root>
# >> ├─交戦
# >> │   ├─攻撃
# >> │   │   ├─剣を振る
# >> │   │   ├─攻撃魔法
# >> │   │   │   ├─召喚A
# >> │   │   │   └─召喚B
# >> │   │   └─縦で剣をはじく
# >> │   └─防御
# >> ├─撤退
# >> │   ├─足止めする
# >> │   │   ├─トラップをしかける
# >> │   │   └─弓矢を放つ
# >> │   └─逃走する
# >> └─休憩
# >>     ├─立ち止まる
# >>     └─回復する
# >>         ├─回復魔法
# >>         └─回復薬を飲む
# >> <root>
# >> ├─交戦
# >> │   ├─攻撃
# >> │   │   ├─剣を振る
# >> │   │   ├─攻撃魔法
# >> │   │   │   ├─召喚A
# >> │   │   │   └─召喚B
# >> │   │   └─縦で剣をはじく
# >> │   └─防御
# >> ├─撤退
# >> │   ├─足止めする
# >> │   │   ├─トラップをしかける
# >> │   │   └─弓矢を放つ
# >> │   └─逃走する
# >> └─休憩
# >>     ├─立ち止まる
# >>     └─回復する
# >>         ├─回復魔法
# >>         └─回復薬を飲む
