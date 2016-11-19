require 'rails_helper'
  describe MessagesController do
    describe 'GET #index' do
      it "renders the :index templete" do
        post :create
        expect(response).to redirect_to root_path
      end
  end

end
