require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET index' do
    shared_examples 'renders successfully' do
      it 'renders the index template' do
        get :index
        assert_template 'index'
      end

      it 'has a 200 status code' do
        get :index
        expect(response.status).to eq(200)
      end
    end

    context 'with no user signed in' do
      include_examples 'renders successfully'
    end

    context 'with admin user signed in' do
      let(:admin_user) { create(:admin_user) }

      before { login_as(admin_user) }

      it 'signs out admin user' do
        get :index
        expect(controller.current_user).to be_nil
      end

      include_examples 'renders successfully'
    end

    context 'with user signed in' do
      let(:user) { create(:user) }

      before { login_as(user) }

      include_examples 'renders successfully'
    end
  end
end
