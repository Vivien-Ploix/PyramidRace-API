class UsersController < ApplicationController

  before_action :set_user, only: [:show, :user_games, :user_games_to_play]

  def index
    if params[:pseudo]
      @users = User.all.select {|user| user.pseudo.start_with?(params[:pseudo])}
      render json: @users
    else
      @users = User.all
      render json: @users 
    end 
  end

  def show
    render json: @user
  end

  def user_games
    @user_games = @user.player1_games + @user.player2_games
    @user_games = @user_games.select {|game| game.winner_id}
    @user_games = @user_games.sort_by(&:updated_at).reverse
    render json: @user_games
  end 

  def user_games_to_play
    @games = @user.player2_games
    @games = @games.select { |game| game.turn === "player2" && !game.winner_id}
    render json: @games
  end


  private

  def set_user
    @user = User.find(params[:id])
  end 


end