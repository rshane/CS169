class Movie < ActiveRecord::Base
  def self.avail_ratings
    ratings = Movie.find(:all, :select => 'rating', :group => 'rating').collect{|m| m.rating}
    return ratings
  end

  def self.sql_ratings(ratings_list)
    ratings        = ratings_list
    sql_where_str  = ""
    ratings.collect{|r| sql_where_str = sql_where_str + "rating = '" +  r[0].to_s + "' or "}
    sql_where_str = sql_where_str.chomp(' or ')
  end

end
