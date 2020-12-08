class UsersController < ApplicationController

  
  def index
    @users = User.all
    render json: @users
  end

  def show
    render_jsonapi_response(@user)
  end

end