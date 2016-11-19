require 'rails_helper'
describe GroupsController, type: :controller do

  describe 'GET #index' do

    it "render template index" do
      get :index
      expect(response).to render_template("index")
      # response.should render_template(:index)
    end
  end

end
