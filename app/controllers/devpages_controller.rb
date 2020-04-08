class DevpagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @coffee_shop = CoffeeShop.first
    render params[:id]
  end
end