class AvatarComponent < ViewComponent::Base

  FALLBACK = "https://api.adorable.io/avatars/285/abott@adorable.png"

  def initialize(user:, type:)
    @user = user
    @type = type
    @css_vars = {}
  end

  def before_render
    @avatar_url = @user.avatar.attached? ? helpers.url_for(@user.avatar.attachment) : FALLBACK
    assign_css_vars(@type)
    @media_object ? @rounded = "is-rounded" : @rounded = ""
  end

  private

  def assign_css_vars(type)
    case type
    when "media_object"
      @figure_classes = "c-user-avatar--small media-left"
      @div_classes = "image is-64x64"
      @img_classes = "is-rounded u-h-100pc"
    when "account"
      @figure_classes = "c-user-avatar--large"
      @div_classes = ""
      @img_classes = ""
    end
  end
end