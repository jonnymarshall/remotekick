class UserMailerPreview < ActionMailer::Preview

  def confirmation_instructions
    user = FactoryBot.build_stubbed(:user)
    UserMailer.confirmation_instructions(user, "faketoken")
  end
end