class UsersController < ApplicationController
  
  before_filter :authenticate_user!, only: [:index, :show]
  
  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def vote
    notice = "Thanks for voting"
    @user = User.find(params[:id])
    #handle user voting for self
    #if @user == current_user, skip add_evaluation and update notice
  	if @user.id == current_user.id
      notice = "You cannot vote for yourself"
    else
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

      begin
    	   @user.add_evaluation(:votes, value, current_user)
    	rescue ActiveRecord::RecordInvalid
          notice = "You have already voted"
      end
    end
    redirect_to :back, notice: notice
  end

end
