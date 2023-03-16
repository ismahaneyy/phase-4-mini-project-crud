class SpicesController < ApplicationController
    wrap_parameters format: []
    def index
        spices = Spice.all 
        render json: spices, status: :ok
    end

    def show
        spice = Spice.find_by(id: params[:id])
        render json: spice, status: :ok
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update 
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice, status: :accepted
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end