class TabComponent < ViewComponent::Base
  def initialize(tab:, icon_name:)
    @tab = tab
    @icon_name = icon_name
  end
end
