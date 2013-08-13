class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :show]
  def index
    @users = User.all
  end
  def show
  	@user = User.find(params[:id])
  end
  def vote
  	case params[:type]
  	when "1"
  		value = 1;
  	when "2"
  		value = 2;
  	when "3"
  		value = 3;
  	when "4"
  		value = 4;
  	when "5"
  		value = 5;
  	else
  	end	
  	@user = User.find(params[:id])
  	@user.add_evaluation(:votes, value, current_user)
  	redirect_to :back, notice: "Thanks for voting"
  end
end
