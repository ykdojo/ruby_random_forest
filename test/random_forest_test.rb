require "ai4r"
include "Ai4r::Data"

rf = RandomForest.new
tree_number = 5
tree_size = 10

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
rf.build(data_set, tree_number, tree_size)
rf.eval(['New York', '<30', 'M'])
rf.eval_verbose(['New York', '<30', 'M']) # should give the first choice and second choice, at the very least.
