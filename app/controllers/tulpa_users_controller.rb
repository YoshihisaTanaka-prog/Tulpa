class TulpaUsersController < ApplicationController
  before_action :set_tulpa_user, only: %i[ show edit update destroy ]

  # GET /tulpa_users or /tulpa_users.json
  def index
    @tulpa_users = TulpaUser.all
  end

  # GET /tulpa_users/1 or /tulpa_users/1.json
  def show
  end

  # GET /tulpa_users/new
  def new
    @tulpa_user = TulpaUser.new
  end

  # GET /tulpa_users/1/edit
  def edit
  end

  # POST /tulpa_users or /tulpa_users.json
  def create
    @tulpa_user = TulpaUser.new(tulpa_user_params)

    respond_to do |format|
      if @tulpa_user.save
        format.html { redirect_to tulpa_user_url(@tulpa_user), notice: "Tulpa user was successfully created." }
        format.json { render :show, status: :created, location: @tulpa_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tulpa_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tulpa_users/1 or /tulpa_users/1.json
  def update
    respond_to do |format|
      if @tulpa_user.update(tulpa_user_params)
        format.html { redirect_to tulpa_user_url(@tulpa_user), notice: "Tulpa user was successfully updated." }
        format.json { render :show, status: :ok, location: @tulpa_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tulpa_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tulpa_users/1 or /tulpa_users/1.json
  def destroy
    @tulpa_user.destroy

    respond_to do |format|
      format.html { redirect_to tulpa_users_url, notice: "Tulpa user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tulpa_user
      @tulpa_user = TulpaUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tulpa_user_params
      params.require(:tulpa_user).permit(:user_id)
    end
end
