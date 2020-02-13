class CityController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def index
    @city = City.all
  end
  def show
    @city = City.find(params[:id])

  end
end
