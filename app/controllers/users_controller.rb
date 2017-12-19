class UsersController < ApplicationController
  access user: {except: %i[index show update edit]}, admin: :all

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @bookings = Booking.where(user_id: params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:roles)
  end
end

