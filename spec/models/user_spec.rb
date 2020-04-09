require 'rails_helper'

RSpec.describe User do
  subject { described_class.new(email: "#{rand(1000000000000)}@gmail.com", password: "password") }

  describe 'validations' do

    describe 'email' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.email = nil
        expect(subject).to_not be_valid
      end
    end

  end
end
