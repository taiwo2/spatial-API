class Api::V1::SpatialLayersController < ApplicationController
  def create
    spatial_layer = SpatialLayer.new(spatial_layer_params)

    if spatial_layer.save
      render json: { message: 'Spatial layer created successfully' }
    else
      render json: { error: spatial_layer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f

    spatial_layer = SpatialLayer.near([latitude, longitude], 1).first

    if spatial_layer
      render json: { name: spatial_layer.name, value: spatial_layer.value }
    else
      render json: { error: 'Spatial layer not found' }, status: :not_found
    end
  end

  private

  def spatial_layer_params
    params.permit(:name, :latitude, :longitude, :value)
  end
end
