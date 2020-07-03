require 'rails_helper'

RSpec.describe User do

  describe 'validations' do

    describe 'email' do
      it 'must be present' do
        user = create(:user)
        expect(user).to be_valid
        user.email = nil
        expect(user).to_not be_valid
      end
    end

  end

  describe '#set_reset_password_token' do
    it 'returns the plaintext token' do
      potential_token = subject.send(:set_reset_password_token)
      potential_token_digest = Devise.token_generator.digest(subject, :reset_password_token, potential_token)
      actual_token_digest = subject.reset_password_token
      expect(potential_token_digest).to eql(actual_token_digest)
    end
  end
end