require 'rails_helper'

describe GroupsController, type: :controller do
  let(:group){ create(:group) }

  before do
   user = create(:user)
   sign_in user
  end

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template root_path
    end
  end

  describe 'GET #new' do
    it "render the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "render the :edit template" do
      get :edit, params: { id: group }
      expect(response).to render_template :edit
    end

    it "assigns the requested contanct to @group" do
      get :edit, params: { id: group }
      expect(assigns(:group)).to eq group
    end
  end
end
