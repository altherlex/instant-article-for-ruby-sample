require 'spec_helper'

describe MateriaController, :vcr do
  describe 'GET :index' do

    context 'RSS' do
      it 'responds' do
        request.headers['Accept'] = 'application/rss+xml'
        get 'index'
        expect(response.status).to eql(200)
      end
    end
  end
end
