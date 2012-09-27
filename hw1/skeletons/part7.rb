class CartesianProduct
  include Enumerable
  def initialize(arr1, arr2)
    arr1 = arr1.to_a
    arr2 = arr2.to_a
    @product = arr1.product(arr2)
  end
  def each
    @product.each do |el|
      yield el
    end
  end
end
