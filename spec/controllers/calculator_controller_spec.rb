require 'rails_helper'

RSpec.describe CalculatorController, type: :controller do
  let(:duel) { double(Duel) }
  let(:chandler) { create(:chandler) }
  let(:monica) { create(:monica) }
  let(:starting_lp) { 8000 }

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

      before { sign_in(admin_user) }

      it 'signs out admin user' do
        get :index
        expect(controller.current_user).to be_nil
      end

      include_examples 'renders successfully'
    end

    context 'with user signed in' do
      before { sign_in(chandler) }

      include_examples 'renders successfully'
    end
  end

  describe 'POST add_player_two' do
    before do
      allow(Duel).to receive(:new).and_return(duel)
      allow(duel).to receive(:save).and_return(true)
    end

    context 'when valid params' do
      it 'creates a new duel with the given attributes' do
        expect(Duel).to receive(:new).with(
          player_one: chandler,
          player_two: monica,
          starting_lp: starting_lp
        ).and_return(duel)
        post :add_player_two, params: {
          user_id: chandler.id,
          starting_lp: starting_lp,
          player_two: { email: monica.email, password: monica.password }
        }, format: :js
      end

      it 'saves the duel' do
        expect(duel).to receive(:save)
        post :add_player_two, params: {
          user_id: chandler.id,
          starting_lp: starting_lp,
          player_two: { email: monica.email, password: monica.password }
        }, format: :js
      end

      context 'when the duel saves successfully' do
        before do
          allow(duel).to receive(:save).and_return(true)
        end

        it 'assigns @duel' do
          post :add_player_two, params: {
            user_id: chandler.id,
            starting_lp: starting_lp,
            player_two: { email: monica.email, password: monica.password }
          }, format: :js
          expect(assigns[:duel]).to eq(duel)
        end

        it 'has a 200 status code' do
          post :add_player_two, params: {
            user_id: chandler.id,
            starting_lp: starting_lp,
            player_two: { email: monica.email, password: monica.password }
          }, format: :js
          expect(response.status).to eq(200)
        end
      end

      context 'when duel does not save' do
        it 'assigns @error' do
          allow(duel).to receive(:save).and_return(false)
          post :add_player_two, params: {
            user_id: chandler.id,
            starting_lp: starting_lp,
            player_two: { email: monica.email, password: monica.password }
          }, format: :js
          expect(assigns[:error]).to eq('Sorry, an error has occurred! Unable to create duel session.')
        end
      end
    end

    context 'when invalid params' do
      context 'without params' do
        it 'renders the 400 template' do
          post :add_player_two
          assert_template(file: '400.html')
        end

        it 'has a 400 status code' do
          post :add_player_two
          expect(response.status).to eq(400)
        end
      end

      context 'when invalid user_id' do
        context 'when user_id is nil' do
          it 'assigns @error' do
            post :add_player_two, params: {
              user_id: nil,
              starting_lp: starting_lp,
              player_two: { email: monica.email, password: monica.password }
            }, format: :js
            expect(assigns[:error]).to eq('Sorry! Invalid email or password.')
          end
        end

        context 'when user cannot be found using user_id' do
          it 'assigns @error' do
            post :add_player_two, params: {
              user_id: 99999,
              starting_lp: starting_lp,
              player_two: { email: monica.email, password: monica.password }
            }, format: :js
            expect(assigns[:error]).to eq('Sorry! Invalid email or password.')
          end
        end
      end

      context 'when invalid player_two' do
        context 'when invalid email' do
          context 'when email is nil' do
            it 'assigns @error' do
              post :add_player_two, params: {
                user_id: chandler.id,
                starting_lp: starting_lp,
                player_two: { email: nil, password: monica.password }
              }, format: :js
              expect(assigns[:error]).to eq('Sorry! Invalid email or password.')
            end
          end

          context 'when email cannot be found' do
            it 'assigns @error' do
              post :add_player_two, params: {
                user_id: chandler.id,
                starting_lp: starting_lp,
                player_two: { email: 'email@doesnt.exit', password: monica.password }
              }, format: :js
              expect(assigns[:error]).to eq('Sorry! Invalid email or password.')
            end
          end
        end

        context 'when invalid password' do
          context 'when password is nil' do
            it 'assigns @error' do
              post :add_player_two, params: {
                user_id: chandler.id,
                starting_lp: starting_lp,
                player_two: { email: monica.email, password: nil }
              }, format: :js
              expect(assigns[:error]).to eq('Sorry! Invalid email or password.')
            end
          end

          context 'when password is incorrect' do
            it 'assigns @error' do
              post :add_player_two, params: {
                user_id: chandler.id,
                starting_lp: starting_lp,
                player_two: { email: monica.email, password: 'notpassword' }
              }, format: :js
              expect(assigns[:error]).to eq('Sorry! Invalid email or password.')
            end
          end
        end
      end

      context 'when player two is player one' do
        it 'assigns @error' do
          post :add_player_two, params: {
            user_id: chandler.id,
            starting_lp: starting_lp,
            player_two: { email: chandler.email, password: chandler.password }
          }, format: :js
          expect(assigns[:error]).to eq('Sorry! Invalid email or password.')
        end
      end
    end
  end

  describe 'POST update_duel' do
    before do
      Timecop.freeze(Time.now)
      allow(Duel).to receive(:find_by).and_return(duel)
      allow(duel).to receive(:id).and_return(1)
      allow(duel).to receive(:ended_at=)
      allow(duel).to receive(:status=)
      allow(duel).to receive(:update).and_return(true)
    end

    context 'when valid params' do
      it 'updates #ended_at with current time' do
        expect(duel).to receive(:ended_at=).with(Time.now)
        post :update_duel, params: { id: duel.id, duel: { player_one_lp: 8000, player_two_lp: 0 } }
      end

      it 'updates #status with completed' do
        expect(duel).to receive(:status=).with(1)
        post :update_duel, params: { id: duel.id, duel: { player_one_lp: 8000, player_two_lp: 0 } }
      end

      it 'updates the duel' do
        expect(duel).to receive(:update)
        post :update_duel, params: { id: duel.id, duel: { player_one_lp: 8000, player_two_lp: 0 } }
      end
 
      context 'when the duel updates successfully' do
        it 'returns JSON with success status code' do
          post :update_duel, params: { id: duel.id, duel: { player_one_lp: 8000, player_two_lp: 0 } }
          expect(response.body).to eq({ msg: 'Success! Duel has been saved.', status: :success }.to_json)
        end
      end

      context 'when the duel does not update' do
        it 'returns JSON with internal server error status code' do
          allow(duel).to receive(:update).and_return(false)
          post :update_duel, params: { id: duel.id, duel: { player_one_lp: 8000, player_two_lp: 0 } }
          expect(response.body).to eq({ error: 'Sorry, duel couldn\'t be saved!', status: :internal_server_error }.to_json)
        end
      end
    end

    context 'when invalid params' do
      context 'without duel params' do
        it 'renders the 400 template' do
          post :update_duel, params: { id: duel.id }
          assert_template(file: '400.html')
        end

        it 'has a 400 status code' do
          post :update_duel, params: { id: duel.id }
          expect(response.status).to eq(400)
        end
      end
    end
  end
end
