module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

  def sort_link(col_name, sort_name, col_id)
    link_to col_name, {:sort => sort_name}, {:id => col_id}
  end

end
