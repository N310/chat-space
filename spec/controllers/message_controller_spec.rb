require 'rails_helper'

describe MessagesController do
  let (:user) { create(:user) }
  let (:group) { create(:group) }
  let (:messages) { create_list(:message, 2, user: user, group: group ) }
  # let (:message) { create(:message, user: user, group: group ) }
  # let(:params) { { message_id: message } }

  describe 'GET #index' do
    context 'user login' do
      before do
        login_user user
        get :index, params: { group_id: group }
      end

      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq group
      end

      it "assigns the requested messages to @messages" do
        expect(assigns(:messages)).to eq messages
      end

      it "assigns the requested message to @message" do
        expect(assigns(:message)).to be_a_new Message
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end

    context 'user logout' do
      it "redirect to new_user_session_path" do
        get :index, params: { group_id: group }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #create' do
    context 'user login' do
      before do
        login_user user
      end

      it "can save message in database" do
        expect{
          post :create, params: { message: attributes_for(:message), group_id: group.id }
        }.to change(Message, :count).by(1) 
      end

      it "redirects to group_messages_path" do
        post :create, params: { message: attributes_for(:message), group_id: group.id }
        expect(response).to redirect_to group_messages_path
      end   
    end
  end
end
