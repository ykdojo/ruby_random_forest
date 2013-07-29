# TODO: perhaps I don't need this?

require "ai4r"
include "Ai4r::Data"

tree = Tree.new

DATA_LABELS = [ 'city', 'age_range', 'gender', 'marketing_target'  ]

DATA_ITEMS = [
       ['New York',  '<30',      'M', 'Y'],
       ['Chicago',     '<30',      'M', 'Y'],
       ['Chicago',     '<30',      'F', 'Y'],
       ['New York',  '<30',      'M', 'Y'],
       ['New York',  '<30',      'M', 'Y'],
       ['Chicago',     '[30-50)',  'M', 'Y'],
       ['New York',  '[30-50)',  'F', 'N'],
       ['Chicago',     '[30-50)',  'F', 'Y'],
       ['New York',  '[30-50)',  'F', 'N'],
       ['Chicago',     '[50-80]', 'M', 'N'],
       ['New York',  '[50-80]', 'F', 'N'],
       ['New York',  '[50-80]', 'M', 'N'],
       ['Chicago',     '[50-80]', 'M', 'N'],
       ['New York',  '[50-80]', 'F', 'N'],
       ['Chicago',     '>80',      'F', 'Y']
]

data_set = DataSet.new(:data_items=>DATA_SET, :data_labels=>DATA_LABELS)
tree.build(data_set)
tree.eval(['New York', '<30', 'M']) # should give "Y" (same as ID3)
