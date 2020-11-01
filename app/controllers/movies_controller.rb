class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :onlyMovies, :onlyTvseries]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  def index
    @movies = Movie.order('title').all
    @allmovies = true
  end

  # GET /onlymovies
  def onlyMovies
    @movies = Movie.where(movie_type: '1').order('title').all
    @onlymovies = true
    render :index
  end

  # GET /onlytvseries
  def onlyTvseries
    @movies = Movie.where(movie_type: '2').order('title').all
    @onlytvseries = true
    render :index
  end

  # GET /movies/1
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
    redirect_to movies_url, notice: 'Movie was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def movie_params
      params.require(:movie).permit(:title, :original_title, :movie_type, :description, :year_start, :year_end, :duration)
    end
end
