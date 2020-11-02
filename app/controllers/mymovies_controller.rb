class MymoviesController < ApplicationController
  before_action :set_mymovie, only: [:show, :edit, :update, :destroy]

  # GET /mymovies
  def index
    @mymovies = Mymovie.all
  end

  # GET /mymovies/1
  def show
  end

  # GET /mymovies/new
  def new
    @mymovie = Mymovie.new
  end

  # GET /mymovies/1/edit
  def edit
  end

  # POST /mymovies
  def create
    @mymovie = Mymovie.new(mymovie_params)

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
      @mymovie = Mymovie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mymovie_params
      params.require(:mymovie).permit(:movie_id, :user_id, :impression, :status, :urgent, :watching_start, :watching_end, :times_watched, :ranking, :watching_season, :last_episode)
    end
end
