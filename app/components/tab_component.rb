class TabComponent < ViewComponent::Base
  def initialize(tab:, icon_name:)
    @tab = tab
    @tab_id = tab.downcase
    @icon_name = icon_name
  end
end
