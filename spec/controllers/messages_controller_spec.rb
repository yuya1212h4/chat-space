require 'rails_helper'

describe MessagesController, type: :controller do
  let(:group){ create(:group) }
  let(:message){ create(:message, group_id: group.id, user_id: user.id) }

  before do
   user = create(:user)
   login_user user
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new, params: { group_id: group.id }
      expect(response).to render_template :new
    end
  end

  context "with valid attributes" do
    it "saves the new message in the database" do
      expect{ create :message }.to change{ Message.count }.by(1)
    end

    it 'redirects to messages#create' do
      post :create, params: { message: attributes_for(:message), group_id: group.id }
      expect(response).to redirect_to new_group_message_path
    end

    it 'render the :show template' do
      post :create, params: { message: attributes_for(:message, body: nil), group_id: group.id }
      expect(response).to render_template :"messages/new"
    end
  end
 end
