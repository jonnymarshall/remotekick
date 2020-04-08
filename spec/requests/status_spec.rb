require 'rails_helper'

RSpec.describe 'Status Requests' do
 describe '200 status request' do

  it 'Homepage responds with 200' do
    get('/')
    expect(response.status).to eql(200)
  end

  it '/venues responds with 200' do
    get('/venues')
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