class CitiesController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @cities = City.all
  end
end