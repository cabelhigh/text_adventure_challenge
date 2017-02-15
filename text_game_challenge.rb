
#An enterable location. Contains a name => "Cavern", a description => "A cold and dark place.", and a number of GoodieBoxes => ["Sink", "Chest", "Cabinet"]
class Location
  attr_accessor :gboxes, :description, :name
  def initialize(name, desc)
    @name = name
    @description = desc
    @gboxes = []
  end

  def addBox box
    @gboxes << box
  end

  def print_all_items
    puts "You are in the #{name}. It is #{description.downcase}"
    @gboxes.each {|gb| puts gb}
  end
end

#An object that holds other items, like a chest containing loot, but can also be physical surfaces like a table or a floor. Contains a name => "Chest", the items inside of it => ["Gold Coins", "Heavy-Bound Book"], and a boolean representing if it is locked, determining whether a player can see its items or not.
class GoodieBox
  attr_accessor :items, :name, :locked

  def initialize(name, locked=false)
    @name=name
    @items = []
    @locked =locked
  end

  def addItem item
    @items << item
  end

  def addItems iArray
    iArray.each do |e|
      @items << e
    end
    self
  end

  def to_s
    if @locked
      str="The #{name} is locked! You don't know what's inside it."
    else
      str = "In the #{name}, there is "
      @items.each_with_index {|item, i| i!=@items.length-1 ? str+="a #{item}, " : str+= "and a #{item}."}
      str
    end
  end
end

#Little more than a String atm. Contains a name => "Fork", and will one day hopefully be more descriptive
class Item
  attr_accessor :name

  def initialize name
    @name=name
  end

  def to_s
    @name
  end
end

l = Location.new("Bedroom", "Your standard starting locaiton.")
g = GoodieBox.new("Sink")
i = Item.new("Dirty Dish")
g.addItem i
g.addItems [Item.new("Knife"), Item.new("Plate"), Item.new("Wash Cloth")]
l.addBox g
g = GoodieBox.new("Chest")
g.addItems [Item.new("Shirt"), Item.new("Key")]
l.addBox g
# l.addBox(GoodieBox.new("Chest").addItem(Item.new()))
l.print_all_items

l2 = Location.new("Attic", "The dark upper landing of the house, tinsled with cobwebs and caked in dust.")
g2 = GoodieBox.new("Mysterious Chest", true)
g2.addItems [Item.new("Family Keepsake"), Item.new("Voodoo Doll"), Item.new("Bloody Picturefame"), Item.new("Box of Letters")]
l2.addBox g2
l2.addBox GoodieBox.new("Cabinet").addItems [Item.new("Shirt"), Item.new("Snuff box")]
l2.print_all_items
