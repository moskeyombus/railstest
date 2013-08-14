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

  	if @user.id == current_user.id
      notice = "You cannot vote for yourself"
    else
      value = params[:type].to_i
      begin
    	   @user.add_evaluation(:votes, value, current_user)
    	rescue ActiveRecord::RecordInvalid
          notice = "You have already voted"
      end
    end
    redirect_to :back, notice: notice
  end

end
