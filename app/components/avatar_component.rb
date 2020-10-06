class AvatarComponent < ViewComponent::Base

  FALLBACK = "https://api.adorable.io/avatars/285/abott@adorable.png"

  SIZE_OPTIONS = {
    "small" => {width: 64, height: 64},
    "large" => {width: 220, height: 220}
  }

  def initialize(user:, size:, rounded: false)
    @user = user
    @avatar_url = "https://api.adorable.io/avatars/285/abott@adorable.png"
    @size = size
    @rounded = rounded
  end

  def before_render
    @avatar_url = @user.avatar.attached? ? helpers.url_for(@user.avatar.attachment) : FALLBACK
    @width = SIZE_OPTIONS.fetch(@size)[:width]
    @height = SIZE_OPTIONS.fetch(@size)[:height]
    @rounded = @rounded ? "is-rounded" : ""
  end
end