class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end


  def index
    #case hit when remove part of URI
    #should redirect to current page with fixed URI

    if (!params[:ratings] and session[:ratings]) or
        (!params[:sort] and session[:sort])
      flash.keep
      redirect_to :action => 'index',
      :sort => params[:sort] ? params[:sort] : session[:sort],
      :ratings => params[:ratings] ? params[:ratings] : session[:ratings]
    end

    session[:ratings] = params[:ratings] ? params[:ratings] : session[:ratings]
    session[:sort]    = params[:sort] ? params[:sort] : session[:sort]

    if session[:ratings].nil?
      ratings = Movie.avail_ratings
      session[:ratings] = {}
      ratings.each {|r| session[:ratings][r] = 1}
    end

    #if title link was clicked
    #if release_date link was clicked
    @title_header   =  params[:sort] == "title" ? "hilite" : nil
    @release_header = params[:sort] == "release_date" ? "hilite" : nil


    if session[:ratings] != nil
      sql_str = Movie.sql_ratings(session[:ratings])
      @movies = Movie.find(:all, :conditions => sql_str, :order => params[:sort])
    else
      @movies = Movie.all(:order => params[:sort])
    end

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
