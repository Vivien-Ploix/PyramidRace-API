class GameHistoriesController < ApplicationController
  
  before_action :set_game_history, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]


  def index
    @game_histories = GameHistory.all 
    render json: @game_histories
  end 

  def show 
    render json: @game_history
  end 

  def create
    @game_history = GameHistory.new(game_history_params)
    if @game_history.save
        render json: @game_history, status: :created, location: game_histories_url(@game_history)
    else 
        render json: @game_history.errors, status: :unprocessable_entity
    end 
  end 

  def destroy
    @game_history.destroy
  end 

  private 

  def set_game_history
    @game_history = GameHistory.find(params[:id])
  end 

  def game_history_params
    params.require(:game_history).permit(:user_id, :game_id, :response_correct, :question_time, :response_time)
  end 
end
