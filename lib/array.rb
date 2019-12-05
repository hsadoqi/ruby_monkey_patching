# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span 
    max - min if !empty?
  end 

  def average 
    reduce(:+).to_f / count.to_f if !empty?
  end 

  def median 
    return nil if empty?
    
    middle = count / 2
    sorted = self.sort
    
    return sorted[middle] if count.odd?
    return sorted[middle-1..middle].average if count.even?
  end

  def counts
    count_hash = Hash.new(0)
    self.each {|ele| count_hash[ele] += 1}
    count_hash
  end 

  def my_count(val)
    counts[val]
  end 

  def my_index(val)
    self.each_with_index {|ele, idx| return idx if ele == val}
    nil
  end

  def my_uniq
    elements = {}
    self.each {|ele| elements[ele] = true}
    elements.keys
  end

  def my_transpose 
    transposed = []

    self.each_with_index do |ele1, idx1|
        row = []

        self.each_with_index do |ele2, idx2|
            row << self[idx2][idx1]
        end
        transposed << row
    end 

    transposed
  end
end
