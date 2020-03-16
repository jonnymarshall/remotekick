class DevpagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    render params[:id]
  end
end