# Author: Yosuke Sugishita (ysugishita@moneytree.jp)
#
# This is an implementation of Random Forest in Ruby, which
# does NOT take random features when creating an underlying
# tree.  The underlying tree structure is implemented using
# ID3 in ai4r at the moment, but it is subject to change in
# the future.
#
# <More features to come in the future>
# - Allow continuous variables as input, not just categorical
# variables.
# - Take random features when building a tree (currently takes
# the whole input row).
# - Allow continous output.

require "ai4r"
include "Ai4r::DataSet"
require "#{File.dir(__FILE__)}/tree.rb"
require "#{File.dir(__FILE__)}/data_set.rb" # adds a "sample" method.

class RandomForest
  # @trees: an array of trees that have been created
  # @data_set: DataSet #TODO more description about this
  attr_accessor :data_set, :trees

  # build the entire forest
  # tree_number: number of trees to be created
  # TODO: more appropriate variable name than tree_number?
  def build(data_set, tree_number, tree_size)
    # use build_tree
    
    # make <tree_number> of trees.
    tree_number.times do |i|
      sample_data = data_set.sample(tree_size) # implemented in lib/data_set.rb
      build_and_save_tree(sample_data)
    end
  end

  # evaluate a value for a given input
  def eval(input)
    results = {} # counts the number of "votes" for each category
                 # example: {"cateogry_1" => 3, "category_2" => 2} 

    max_key = nil
    @trees.each do |tree|
      tree_output = tree.eval(input)
      # TODO: add a throw code for "Rule not found"
      # TODO: if rule not found, do stg
      if results.has_key?(tree_output)
        results[tree_output] += 1
      else 
        results[tree_output] = 1
      end

      return mode(results) # TODO: think of a nice way to find the mode quickly.
    end
  end

  # gives more info than eval, but runs more slowly.
  def eval_verbose(input)
  end

  private
    # build a tree and add it to the @trees array.
    def build_and_save_tree(data_set)
      tree = Tree.new
      tree.build(data_set) 
      trees << tree
    end
end
