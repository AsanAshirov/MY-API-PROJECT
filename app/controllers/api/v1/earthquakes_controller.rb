class Api::V1::EarthquakesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_earthquake, only: [:show, :update, :destroy]
  
  def index
    cache_key = [current_user, 'earthquakes', params[:page]]
    @earthquakes = Rails.cache.fetch(cache_key, expires_in: 12.hours) do
      Earthquake.by_user(current_user).paginate(page: params[:page], per_page: 20).to_a
    end
    render json: @earthquakes
  end

  def show
    #@earthquake = Earthquake.by_user(current_user).find(params[:id])
    render json: @earthquake
  end

  def create
    @earthquake = Earthquake.new(valid_params)
    if @earthquake.save
      render json: @earthquake, status: 200
    else
      render json: @earthquake.errors, status: :unprocessable_entity
    end
  end

  def update
    #@earthquake = Earthquake.by_user(current_user).find(params[:id])
    if @earthquake
      @earthquake.update(valid_params)
      render json: {message: "Earthquake Information Updated"}, status: 200
    else
      render json: {error: "Unable to Update Earthquake Information"}, status: 500
    end
  end

  def destroy
    #@earthquake = Earthquake.by_user(current_user).find(params[:id])
    if @earthquake
      @earthquake.destroy
      render json: {message: "Earthquake Information Destroyed"}, status: 200
      else
        render json: {error: "Unable to Destroy Earthquake Information"}, status: 500
      end
  end

  private

  def valid_params
    params.require(:earthquake).permit(:date, :time, :latitude, :longitude, :location, :depth)
  end

  def set_earthquake
    @earthquake = Earthquake.by_user(current_user).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {error: "Unable to find Earthquake Information"}, status: 404
  end
end
