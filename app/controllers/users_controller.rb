class UsersController < ApplicationController

  
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
    @user = User.find(params[:id])
    render json: @user
  end

  def user_games
    @user = User.find(params[:id])
    @user_games = @user.player1_games + @user.player2_games
    @user_games = @user_games.sort_by(&:updated_at).reverse
    render json: @user_games
  end 


end