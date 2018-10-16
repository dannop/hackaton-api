class AchievmentsController < ApplicationController
  before_action :set_achievment, only: [:show, :update, :destroy]

  # GET /achievments
  def index
    @achievments = Achievment.all

    render json: @achievments
  end

  # GET /achievments/1
  def show
    render json: @achievment
  end

  # POST /achievments
  def create
    @achievment = Achievment.new(achievment_params)

    if @achievment.save
      render json: @achievment, status: :created, location: @achievment
    else
      render json: @achievment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /achievments/1
  def update
    if @achievment.update(achievment_params)
      render json: @achievment
    else
      render json: @achievment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /achievments/1
  def destroy
    @achievment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievment
      @achievment = Achievment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def achievment_params
      params.require(:achievment).permit(:name, :description, :image)
    end
end
