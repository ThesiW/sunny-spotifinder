class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
  @user = User.find(params[:id])
  @user = Useer.all
  end
end
