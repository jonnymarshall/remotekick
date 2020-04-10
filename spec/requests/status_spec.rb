require 'rails_helper'

RSpec.describe 'Status Requests' do
  let(:u) { create(:user) }

  describe '200 status request' do

    it 'Homepage responds with 200' do
      get('/')
      expect(response.status).to eql(200)
    end

    it '/venues responds with 200' do
      get('/venues')
      expect(response.status).to eql(200)
    end

    it '/venues/new responds with 302 when not signed in' do
      get('/venues/new')
      expect(response.status).to eql(302)
    end

    it '/venues/new responds with 200 when signed in' do
      sign_in u
      get('/venues/new')
      expect(response.status).to eql(200)
    end

    it '/users/sign_in responds with 200' do
      get('/users/sign_in')
      expect(response.status).to eql(200)
    end

    it '/users/sign_up responds with 200' do
      get('/users/sign_up')
      expect(response.status).to eql(200)
    end

  end
end