class DevelopmentController < ApplicationController
  before_action :authenticate_user!, except: [:development_bulma, :development_home, :development_index, :development_show]

  def development_bulma
  end

  def development_home
  end

  def development_index
  end

  def development_show
  end

  def development_reviews_new
  end

  def development_slider
  end
end