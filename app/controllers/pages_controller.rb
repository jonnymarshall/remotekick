class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  # layout false, only: [:home]
  def home
  end
end
