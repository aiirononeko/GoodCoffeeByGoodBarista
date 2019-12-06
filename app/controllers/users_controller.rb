class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
  end
  
  def contact
    @user = User.find(params[:id])
    NotificationMailer.send_confirm_to_user(@user).deliver_later
    redirect_to user_path(@user), notice: '面談の提案を送信しました。相手からの返信をお待ちください。'
  end

  def search_params
    params.require(:q).permit(:sex_eq)
  end
end
