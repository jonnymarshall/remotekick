require "rails_helper"

RSpec.describe ReviewMailer, type: :mailer do
  describe 'new_review_posted', focus: true do
    let(:u) { create(:user) }
    let(:ven) { create(:venue, users: [u]) }
    let(:rev) { create(:review, user: u, venue: ven) }
    let(:mail) { described_class.new_review_posted(user: u, review: rev, venue: ven).deliver_now }

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

    it 'assigns review' do
      expect(mail.html_part.body.decoded).to include(rev.content)
    end
  end
end
