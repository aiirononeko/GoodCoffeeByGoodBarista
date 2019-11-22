class OwnerSessionsController < ApplicationController
  def new
  end

  def create
    @owner = Owner.find_by(email: owner_session_params[:email])
    if @owner&.authenticate(owner_session_params[:password])
      session[:owner_id] = @owner.id
      redirect_to users_path, notice: 'ログインしました'
    else
      render :new
      flash[:notice] = 'ログインに失敗しました'
    end 
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'ログアウトしました'
  end

  private

  def owner_session_params
    params.require(:session).permit(:email, :password)
  end
end
