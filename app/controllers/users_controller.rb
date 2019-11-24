class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def contact
    @user = User.find(params[:id])
    NotificationMailer.send_confirm_to_user(@user).deliver_later
    redirect_to user_path(@user), notice: '面談の提案を送信しました。相手からの返信をお待ちください。'
  end
end
