class FlashComponent < ViewComponent::Base
  def initialize(key:, value:)
    @key = key
    @value = value
    @notice_class = ""
  end

  def before_render
    case @key
    when "notice"
      @notice_class = "info"
    when "alert"
      @notice_class = "warning"
    when "success"
      @notice_class = "success"
    when "error"
      @notice_class = "danger"
    end
  end
end
