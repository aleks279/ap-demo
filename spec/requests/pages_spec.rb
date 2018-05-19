require 'rails_helper'

describe 'Pages' do
  describe 'GET /admin/pages/X' do
    let(:page) { create(:page) }

    before :each do
      get page_path(page)
    end

    it 'gets the correct page' do
      expect(assigns(:page)).to eq page
    end

    it 'renders the show template' do
      expect(response).to render_template :show
    end
  end
end
