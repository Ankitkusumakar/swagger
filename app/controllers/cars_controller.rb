class CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :destroy]

  # GET /cars
  def index
    @cars = Car.all

    render json: @cars
  end

  # GET /cars/1
  def show
    # @cars = Car.find_by(params[:id])
    render json: @cars
  end
   

  # POST /cars
  def create
    @cars = Car.new(car_params)

    if @cars.save
      render json: @cars, status: :created, location: @cars
    else
      render json: @cars.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1
  def update
    # @cars = Car.find_by(params[:id])
    if @cars.update(car_params)
      render json: @cars
    else
      render json: @cars.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    @cars.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @cars = Car.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def car_params
      params.permit(:name, :model)
    end
end
