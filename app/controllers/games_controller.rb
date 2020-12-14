class GamesController < ApplicationController

  before_action :set_game, only: [:show, :destroy, :update]
  before_action :authenticate_user!, only: [:create, :destroy]


  def index
    @games = Game.all 
    render json: @games
  end 

  def show 
    render json: @game
  end 

  def create
    @game = Game.new(game_params)
    if @game.save
        render json: @game, status: :created, location: games_url(@game)
    else 
        render json: @game.errors, status: :unprocessable_entity
    end 
  end 

  def update 
    
    if @game.update(game_update_params)
      render json: @game, location: games_url(@game)
    else 
      render json: @game.errors, status: :unprocessable_entity
    end 
  end 

  def destroy
    @game.destroy
  end 

  private 

  def set_game
    @game = Game.find(params[:id])
  end 

  def game_params
    params.require(:game).permit(:difficulty, :player1_id, :player2_id, :category, :turn)
  end 

  def game_update_params
    params.require(:game).permit(:turn, :winner_id)
  end 

end
