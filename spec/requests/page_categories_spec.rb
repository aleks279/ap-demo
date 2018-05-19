require 'rails_helper'

describe 'PageCategories' do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /admin/page_categories' do
    it 'succeds' do
      get admin_page_categories_path
      expect(response).to be_success
    end
  end

  describe 'GET /admin/page_categories/X' do
    let(:page_category) { create(:page_category) }

    before :each do
      get admin_page_category_path(page_category)
    end

    it 'gets the correct page category' do
      expect(assigns(:category)).to eq page_category
    end

    it 'renders the show template' do
      expect(response).to render_template :show
    end
  end

  describe 'POST new page category' do
    context 'with valid attributes' do
      it 'creates the new category' do
        expect {
          post '/admin/page_categories', params: { page_category: attributes_for(:page_category) }
        }.to change(PageCategory, :count).by(1)
      end

      xit 'redirects to the new category' do
        post '/admin/page_categories', params: { page_category: attributes_for(:page_category) }
        expect(response).to redirect_to admin_page_category_path(PageCategory.last)
      end
    end
  end

end
