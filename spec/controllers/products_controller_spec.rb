require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  render_views

  describe '#index' do
    context 'when not given params' do
      let(:params) { {} }
      before(:each) { get(:index, params: params) }

      it 'returns list of products' do
        expect(assigns(:products_form)).to_not be_nil
        expect(assigns(:products_form).records.count).to eq(0)
      end

      it 'renders index view' do
        expect(response.status).to eq(200)
        expect(response).to render_template(:index)
        expect(response.body).to match('List of products')
      end
    end
  end
end
