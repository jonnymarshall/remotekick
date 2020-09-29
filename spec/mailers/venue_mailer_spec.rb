require "rails_helper"

RSpec.describe VenueMailer, type: :mailer do
  
  describe 'new_venue_listed' do
    let(:u) { create(:user) }
    let(:ven) { create(:venue, users: [u]) }
    let(:mail) { described_class.new_venue_listed(user: u, venue: ven).deliver_now }

    it 'has the venue name in the subject' do
      expect(mail.subject).to include(ven.name)
    end

    it "has venue.user as the receiver of the email" do
      expect(mail.to).to eq([u.email])
    end

    it 'has team@remotekick.com as the sender email' do
      expect(mail.from).to eq(['team@remotekick.com'])
    end

    it 'assigns venue' do
      expect(mail.html_part.body.decoded).to include(ven.name)
    end
  end

end