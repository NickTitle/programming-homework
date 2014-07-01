# data structure for blocks
class Block
  attr_accessor :name, :neighbors, :group, :position, :perimeter
  @name = nil
  @neighbors = {}
  @group = nil
  @position = nil
  @perimeter = 4

  def initialize
    @name = nil
    @neighbors = {'left'=>nil, 'right'=>nil,'top'=>nil, 'bottom'=>nil}
    @group = nil
    @position = nil
    @perimeter = 4
  end

  def calculate_perimeter
    @perimeter = 4
    @neighbors.each do |k,neighbor|
      if neighbor && @name == neighbor.name
        @perimeter -= 1
      end
    end
  end
end

#globals
$plan_width = 0
$plan_height = 0
$lines_array = []
$group_array = []
$stats_hash = {}

$block_input = 
"ooooooooooooooooooooooDDDDDooooooooooooooooooooooooooooo
ooooooooooooooooooooooDDDDDooooooooooooooooooooooooooooo
ooo##################o#####o#########################ooo
o@o##################o#####o#########################ooo
ooo##################o#####o#########################oTo
o@o##################################################ooo
ooo##################################################oTo
o@o############ccccccccccccccccccccccc###############ooo
pppppppppppppppcOOOOOOOOOOOOOOOOOOOOOc###############oTo
o@o############cOBBBBBBBBBBBBBBBBBBBOc###############ooo
ooo####V#######cOBBBBBBBBBBBBBBBBBBBOc###############oTo
o@o####V#######cOBBBBBBBBBBBBBBBBBBBOc###############ooo
ooo####V#######cOBBBBBBBBBBBBBBBBBBBOcpppppppppppppppppp
o@o####V#######cOBBBBBBBBBBBBBBBBBBBOc###############ooo
ooo####V#######cOBBBBBBBBBBBBBBBBBBBOc######v########oTo
o@o####V#######cOBBBBBBBBBBBBBBBBBBBOc######v########ooo
ooo####V#######cOOOOOOOOOOOOOOOOOOOOOc######v########oTo
o@o####V#######ccccccccccccccccccccccc######v########ooo
ooo####V#######ppppppppppppppppppppppp######v########oTo
o@o############ppppppppppppppppppppppp###############ooo
oooooooooooooooooooooooooooooooooooooooooooooooooooooooo
oooooooooooooooooooooooooooooooooooooooooooooooooooooooo"

#methods
def find_neighbors (line_in_question, index_of_line, block_in_question, index_of_block)
  #find top neighbor
  if index_of_line > 0
    previousLine = $lines_array[index_of_line-1]
    aboveBlock = previousLine[index_of_block]
    block_in_question.neighbors['top'] = aboveBlock
  end

  #find bottom neighbor
  if index_of_line < $lines_array.length-1
    nextLine = $lines_array[index_of_line+1]
    aboveBlock = nextLine[index_of_block]
    block_in_question.neighbors['bottom'] = aboveBlock
  end

  #find left neighbor
  if index_of_block > 0
    previousBlock = line_in_question[index_of_block-1]
    block_in_question.neighbors['left'] = previousBlock
  end    

  #find right neighbor
  if index_of_block < line_in_question.length-1
    nextBlock = line_in_question[index_of_block+1]
    block_in_question.neighbors['right'] = nextBlock
  end

  block_in_question.calculate_perimeter
end

def set_group_for_block(block_in_question)
  group_to_merge = [block_in_question]
  
  block_in_question.neighbors.each do |k, neighbor_block|
    
    
    #check for valid neighbor
    if neighbor_block && neighbor_block.name == block_in_question.name
        group_to_merge << neighbor_block
    end
  end

  merge_group_of_blocks(group_to_merge)
end

def merge_group_of_blocks(group)
  lowest_found_group = nil

  #find lowest group number in collection
  group.each do |block|
    if block.group && !lowest_found_group
      lowest_found_group = block.group
    elsif block.group && lowest_found_group && (lowest_found_group < block.group)
      lowest_found_group = block.group
    end
  end

  if lowest_found_group
    group.each do |block|
      block.group = lowest_found_group
      $group_array[lowest_found_group] << block
      $group_array[lowest_found_group].uniq!
    end
    
  else
    lowest_found_group = $group_array.count;
    group.each do |block|
      block.group = lowest_found_group
    end
    $group_array[lowest_found_group] = group
    $group_array[lowest_found_group].uniq!
  end
end

def show_groups
  $lines_array.each do |l|
    l.each do |b|
      print (b.group < 10 ? " #{b.group} " : "#{b.group} ")
    end
    puts "\n"
  end
end

def calculate_group_stats(group)
  total_perimeter = 0
  group.each do |block|
    total_perimeter+=block.perimeter
  end
  outputHash = {'area'=>group.length, 'perimeter'=>total_perimeter, 'block_type'=>group[0].name}
  return outputHash
end

def create_aggregate_groups
  $group_array.each do |group|
    #isolate each group, get their stats
    group_in_question = calculate_group_stats(group)

    #extract type for brevity
    group_type = group_in_question['block_type']

    #find if it exists in the group hash or not
    if !$stats_hash[group_type]
      $stats_hash[group_type] = {'block_type'=>group_type, 'area'=>group_in_question['area'], 'perimeter'=>group_in_question['perimeter'], 'total_blocks'=>1}
    else
      $stats_hash[group_type]['area']+=group_in_question['area']
      $stats_hash[group_type]['perimeter']+=group_in_question['perimeter']
      $stats_hash[group_type]['total_blocks']+=1
    end
  end
end

def print_out_results
  $stats_hash.each do |k,v|
    block_or_blocks = v['total_blocks']>1 ? 'blocks' : 'block'
    puts "#{k}: Total SF (#{v['area']}), Total Circumference LF (#{v['perimeter']}) - Found #{v['total_blocks']} #{block_or_blocks}\n"
  end
end


#create line arrays
$block_input.each_line do |l|
  
  # work on dimensions
  $plan_height += 1
  if l.length > $plan_width
    $plan_width = l.length
  end

  #create subarray for each line
  line_in_question = []
  l.each_char.with_index do |c, i|
    block_in_question = Block.new()
    block_in_question.name = c
    block_in_question.position = [i, line_in_question];
    line_in_question << block_in_question unless c == "\n"
  end
  $lines_array << line_in_question;
end

$lines_array.each.with_index do |line_in_question, l_index|
  
  #line In Question
  line_in_question.each.with_index do |block_in_question, index_of_block|
    find_neighbors(line_in_question, l_index, block_in_question, index_of_block)
    set_group_for_block(block_in_question)
  end
end

puts $block_input
show_groups
create_aggregate_groups
print_out_results