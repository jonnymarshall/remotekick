class AvatarComponent < ViewComponent::Base

  FALLBACK = "https://api.adorable.io/avatars/285/abott@adorable.png"

  def initialize(user:, media_object: false)
    @user = user
    @media_object = media_object
    @rounded = ""
  end

  def before_render
    @avatar_url = @user.avatar.attached? ? helpers.url_for(@user.avatar.attachment) : FALLBACK
    assign_size if @media_object
    @media_object ? @rounded = "is-rounded" : @rounded = ""
  end

  private

  def assign_size
    @height = "64"
    @width = "64"
  end
end