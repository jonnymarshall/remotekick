class DevelopmentController < ApplicationController
  before_action :authenticate_user!, except: [:development_bulma, :development_home, :development_index]

  def development_bulma
  end

  def development_home
  end

  def development_index
  end
end