class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  attr_accessor :name, :calories

  def healthy?
    @calories < 200 ? true : false
  end

  def delicious?
    return true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end

  attr_accessor :name, :calories, :flavor

  def delicious?
    @flavor == 'black licorice' ? false : true
  end
end
