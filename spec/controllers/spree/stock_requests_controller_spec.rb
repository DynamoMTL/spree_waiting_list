require 'spec_helper'

module Spree

  describe StockRequestsController, :type => :controller do

    let(:user) { create(:user_with_addreses) }
    let!(:variant) { create(:master_variant) }

    before do
      allow(controller).to receive_messages(:try_spree_current_user => nil)
    end

    it '#new' do
      spree_get :new, stock_request: {variant_id: variant.id}

      expect(response).to be_success
    end

    context '#create' do

      context 'valid data' do

        USER_MAIL = 'user@gmail.com'

        it 'html format' do
          spree_post :create, :stock_request => {email: USER_MAIL, variant_id: variant.id}

          expect(response).to redirect_to(spree.root_path)
          expect(flash[:notice]).to eql(Spree.t(:successful_stock_request))
          expect(Spree::StockRequest.where(email: USER_MAIL).first).to_not be_nil

        end

        it 'js format' do

          spree_post :create, {:stock_request => {email: USER_MAIL, variant_id: variant.id}, :format => :js}

          expect(response).to be_success
          expect(response).to render_template('create')

        end

        context 'logged in' do

          before do
            allow(controller).to receive_messages(:try_spree_current_user => user)
          end

          it 'should set email' do
            spree_post :create, stock_request: {variant_id: variant.id}

            expect(Spree::StockRequest.where(email: user.email).first).to_not be_nil
          end
        end

      end

      context 'invalid data' do

        it 'raises an exception' do
          expect { spree_post :create }.to raise_error ActionController::ParameterMissing
        end

        context 'show messages validation' do

          it 'html format' do
            spree_post :create, stock_request: {email: 'user'}

            expect(response).to render_template('new')
          end

          it 'js format' do
            spree_xhr_post :create, {:stock_request => {email: 'user'}}

            expect(response.status).to eql(Rack::Utils::SYMBOL_TO_STATUS_CODE[:unprocessable_entity])
          end
        end
      end
    end
  end
end
