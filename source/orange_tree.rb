# This is how you define your own custom exception classes
class NoOrangesError < StandardError
end

class OrangeTree
  attr_reader :height, :age
  # Ages the tree one year
  def initialize
    @age = 0
    @height = 0
    @oranges = []
  end

  def age
    @age
  end

  def height
    @height
  end

  def age!
    @age += 1
    @height += 1
    if @age < 10
      return
    else
      (rand(10) + 1).times { @oranges << Orange.new(@avg_diameter) }
    end
    if @age > 25
      @height = 25
    else
      @height += 1
    end


  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def any_oranges?
    @oranges.length > 0
    #   return true
    # else
    #   return false
    # end
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange!
    #raise NoOrangesError, "This tree has no oranges" unless self.any_oranges?
    @oranges.pop
    # orange-picking logic goes here

  end

  def dead?
    if @age > 30
      true
    else
      false
    end
  end

  def avg_diameter
    @avg_diameter = (4..7).to_a.sample
  end
end

class Orange
  attr_reader :diameter
  # Initializes a new Orange with diameter +diameter+
  def initialize(diameter)
    @diameter = diameter
  end
end








tree = OrangeTree.new

# tree.age! until tree.any_oranges?

puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

until tree.dead?
  basket = []

  # It places the oranges in the basket
  # IT PLACES THE ORANGES IN THE BASKET
  while tree.any_oranges?
    basket << tree.pick_an_orange!
  end

  avg_diameter = tree.avg_diameter# It's up to you to calculate the average diameter for this harvest.

  puts "Year #{tree.age} Report"
  puts "Tree height: #{tree.height} feet"
  puts "Harvest:     #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
  puts ""

  # Age the tree another year
  tree.age!
end

puts "Alas, the tree, she is dead!"