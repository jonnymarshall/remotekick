class DevelopmentController < ApplicationController
  before_action :authenticate_user!, except: [:bulma_templates, :test_page]

  def bulma_templates
  end
  def test_page
  end
end