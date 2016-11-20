require 'rails_helper'
describe GroupsController, type: :controller do

  describe 'GET #index' do
    it "render template index" do
      get :index
      expect(response).to render_template root_path
      # expect(response.status).to eq 200
      # response.should render_template(:index)
    end
  end

end
