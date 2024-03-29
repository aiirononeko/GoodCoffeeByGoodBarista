class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  # GET /owners
  # GET /owners.json
  def index
    @q = Owner.ransack(params[:q])
    @owners = @q.result(distinct: true).page(params[:page])
  end

  # GET /owners/1
  # GET /owners/1.json
  def show
  end

  # GET /owners/new
  def new
    @owner = Owner.new
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  # POST /owners.json
  def create
    @owner = Owner.new(owner_params)

    respond_to do |format|
      if @owner.save
        format.html { redirect_to @owner, notice: "GoodCoffeeByGoodBaristaへようこそ、#{@owner.name}さん！" }
        session[:owner_id] = @owner.id
        format.json { render :show, status: :created, location: @owner }
      else
        format.html { render :new }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owners/1
  # PATCH/PUT /owners/1.json
  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to edit_owner_path(@owner), notice: 'プロフィールを更新しました' }
        format.json { render :show, status: :ok, location: @owner }
      else
        format.html { render :edit }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: 'Owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def contact
    @owner = Owner.find(params[:id])
    NotificationMailer.send_confirm_to_owner(@owner).deliver_later
    redirect_to owner_path(@owner), notice: '面談の提案を送信しました。相手からの返信をお待ちください。'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @owner = Owner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owner_params
      params.require(:owner).permit(:company, :name, :tel, :email, :password, :password_confirmation, :image, :title, :about, :introduce, :wanted, :status, :address)
    end

    def search_params
      params.require(:q).permit(:company_cont)
    end
end
