class UserMailerPreview < ActionMailer::Previewß

  def confirmation_instructions
    user = FactoryBot.build_stubbed(:user)
    UserMailer.confirmation_instructions(user: user, token: "faketoken")
  end
end