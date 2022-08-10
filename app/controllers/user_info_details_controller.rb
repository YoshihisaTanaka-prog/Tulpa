class UserInfoDetailsController < ApplicationController
  before_action :set_user_info_detail, only: %i[ show edit update destroy ]

  # GET /user_info_details or /user_info_details.json
  def index
    @user_info_details = UserInfoDetail.all
  end

  # GET /user_info_details/1 or /user_info_details/1.json
  def show
  end

  # GET /user_info_details/new
  def new
    @user_info_detail = UserInfoDetail.new
  end

  # GET /user_info_details/1/edit
  def edit
  end

  # POST /user_info_details or /user_info_details.json
  def create
    @user_info_detail = UserInfoDetail.new(user_info_detail_params)

    respond_to do |format|
      if @user_info_detail.confirm_and_save( @user )
        format.html { redirect_to user_info_detail_url(@user_info_detail), notice: "User info detail was successfully created." }
        format.json { render :show, status: :created, location: @user_info_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_info_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_info_details/1 or /user_info_details/1.json
  def update
    respond_to do |format|
      if @user_info_detail.confirm_and_update(user_info_detail_params, @user)
        format.html { redirect_to user_info_detail_url(@user_info_detail), notice: "User info detail was successfully updated." }
        format.json { render :show, status: :ok, location: @user_info_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_info_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_info_details/1 or /user_info_details/1.json
  def destroy
    @user_info_detail.destroy

    respond_to do |format|
      format.html { redirect_to user_info_details_url, notice: "User info detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_info_detail
      @user_info_detail = UserInfoDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_info_detail_params
      params.require(:user_info_detail).permit(:text, :category_id, :user_info_id)
    end
end
