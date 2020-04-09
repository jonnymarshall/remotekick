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
end
