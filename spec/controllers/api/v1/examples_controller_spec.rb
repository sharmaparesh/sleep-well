require 'rails_helper'

RSpec.describe Api::V1::ExamplesController, type: :controller do
  describe 'GET #show' do
    it 'should success with a http 200 status code' do
      get :show

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(200)
    end
  end
end
