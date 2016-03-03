class Set

  def initialize(array=[])
    if array.class != Array
      @array = []
    else
      @array = array.uniq
    end
  end

  def to_array
    @array
  end

  def add(element)
    if @array.include?(element) == false
      @array << element
    end
  end

  def delete(element)
    if @array.include?(element)
      @array.delete(element)
    end
  end

  def contains(element)
    if @array.include?(element)
      return true
    else
      return false
    end
  end

  def union(set)
    unionSet = Set.new(@array)
    newSet = set.to_array
      newSet.each do |element|
        unionSet.add(element)
      end
    return unionSet
  end

  def intersection(set)
    intersectionSet = Set.new
    otherArray = set.to_array
    @array.each do |element|
      otherArray.each do |otherElement|
        if element == otherElement
          intersectionSet.add(element)
        end
      end
    end
    return intersectionSet
  end

  def complement(set)
    complementSet = []
    otherArray = set.to_array
    otherArray.each do |otherElement|
      if @array.include?(otherElement) == false
        complementSet << otherElement
      end
    end
    return complementSet
  end

  def xor(set)
    xorSet = []
    otherArray = set.to_array
    @array.each do |element|
      otherArray.each do |otherElement|
        if @array.include?(otherElement) == false && otherArray.include?(element) == false && xorSet.include?(element) == false && xorSet.include?(otherElement) == false
          xorSet << element
          xorSet << otherElement
        end
      end
    end
    return xorSet
  end

  def subset(set)
    otherArray = set.to_array
    counter = 0
    otherArray.each do |element|
      if @array.include?(element)
        counter += 1
      end
    end
    return counter == @array.length
  end

  def sortSet
    loopTimes = @array.length - 1
    loop do
      swapped = false
      (loopTimes).times do |i|
        if @array[i] > @array[i+1] 
          @array[i], @array[i+1] = @array[i+1], @array[i]
          swapped = true
        end
      end
      if swapped == false
        break
      end
    end
    @array
  end

  def reverseSet
    loopTimes = @array.length/2
    loopTimes.times {|i| @array[i], @array[-i-1] = @array[-i-1], @array[i]}
    @array
  end

end