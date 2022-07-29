class AnglesController < ApplicationController
  before_action :set_angle, only: %i[ show edit update destroy ]

  # GET /angles or /angles.json
  def index
    @angles = Angle.all
  end

  # GET /angles/1 or /angles/1.json
  def show
  end

  # GET /angles/new
  def new
    @angle = Angle.new
  end

  # GET /angles/1/edit
  def edit
  end

  # POST /angles or /angles.json
  def create
    @angle = Angle.new(angle_params)

    respond_to do |format|
      if @angle.save
        format.html { redirect_to angle_url(@angle), notice: "Angle was successfully created." }
        format.json { render :show, status: :created, location: @angle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @angle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /angles/1 or /angles/1.json
  def update
    respond_to do |format|
      if @angle.update(angle_params)
        format.html { redirect_to angle_url(@angle), notice: "Angle was successfully updated." }
        format.json { render :show, status: :ok, location: @angle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @angle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /angles/1 or /angles/1.json
  def destroy
    @angle.destroy

    respond_to do |format|
      format.html { redirect_to angles_url, notice: "Angle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_angle
      @angle = Angle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def angle_params
      params.require(:angle).permit(:name)
    end
end
