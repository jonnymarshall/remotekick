class MediaObjectAvatarComponent < ViewComponent::Base

  def initialize(user:)
    @user = user
    @avatar_url = "https://bulma.io/images/placeholders/128x128.png"
  end

  def before_render
    @avatar_url = helpers.url_for(@user.avatar.attachment) if @user.avatar.attached?
  end
end