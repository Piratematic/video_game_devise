class VideoGamesController < ApplicationController
  before_action :set_video_game, only: [:show, :edit, :update, :destroy]
 
  def index
    @video_games = current_user.video_games
  end

  def show
  end

  def new
    @video_game = VideoGame.new
  end

  def create
    @video_game = current_user.video_games.new(video_game_params)
    if @video_game.save
      redirect_to video_games_path
    else
      video_game :new
    end
  end

  def edit
  end

  def update
    if @video_game.update(video_game_params)
      redirect_to video_game_path(@video_game)
    else
      render :edit
    end
  end

  def destroy
    @video_game.destroy
    redirect_to video_game_path
  end

  private
    def video_game_params
      params.require(:video_game).permit(:name)
    end

    def set_video_game
      @video_game = current_user.video_game.find(params[:id])
    end
end