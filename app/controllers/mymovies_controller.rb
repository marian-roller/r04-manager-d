class MymoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mymovie, only: [:show, :edit, :update, :destroy]

  # GET /mymovies
  def index
    # @mymovies = current_user.mymovies.where(urgent: TRUE)
    @mymovies = current_user.mymovies.joins("INNER JOIN movies ON movies.id = mymovies.movie_id AND movies.movie_type = 1")
    @allmymovies = true
  end

  def myTvseries
    @mymovies = current_user.mymovies.joins("INNER JOIN movies ON movies.id = mymovies.movie_id AND movies.movie_type = 2")
    @allmytvseries = true
    render :index
  end

  # replaced by reflex
  # def resetStatus
  #   @mymovie.update(mymovie_params)
  #
  #   if @mymovie.movie.movie_type == 2
  #     @allmytvseries = true
  #     redirect_to myonlytvseries_url
  #   else
  #     redirect_to mymovies_url
  #   end
  # end

  # replaced by reflex
  # def updateEpisode
  #   new_params = @mymovie.update_episode_season_status
  #   @mymovie.update(new_params)
  #   @allmytvseries = true
  #   redirect_to myonlytvseries_url
  # end

  # GET /mymovies/1
  def show
  end

  # GET /mymovies/new
  def new
    @mymovie = current_user.mymovies.build
  end

  # GET /mymovies/1/edit
  def edit
  end

  # POST /mymovies
  def create
    @mymovie = current_user.mymovies.build(mymovie_params)
    if @mymovie.save
      redirect_to @mymovie, notice: 'Mymovie was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mymovies/1
  def update
    if @mymovie.update(mymovie_params)
      redirect_to @mymovie, notice: 'Mymovie was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mymovies/1
  def destroy
    @mymovie.destroy
    redirect_to mymovies_url, notice: 'Mymovie was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mymovie
      @mymovie = current_user.mymovies.find(params[:id])
      @mymovies = true
    end

    # Only allow a trusted parameter "white list" through.
    def mymovie_params
      params.require(:mymovie).permit(:id, :movie_id, :user_id, :impression, :status, :urgent, :watching_start, :watching_end, :times_watched, :ranking, :watching_season, :last_episode)
    end
end
