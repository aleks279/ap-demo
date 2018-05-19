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
          post '/admin/page_categories', page_category: attributes_for(:page_category)
        }.to change(PageCategory, :count).by(1)
      end

      it 'redirects to the new category' do
        post '/admin/page_categories', page_category: attributes_for(:page_category)
        expect(response).to redirect_to admin_page_category_path(PageCategory.last)
      end
    end

    context 'with invalid attributes' do
      it 'doesnt create the new category' do
        expect {
          post '/admin/page_categories', page_category: attributes_for(:invalid_page_category)
        }.to_not change(PageCategory, :count)
      end

      it 're-renders the new method' do
        post '/admin/page_categories', page_category: attributes_for(:invalid_page_category)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT update category' do
    let(:category) { create(:page_category) }

    context 'with valid params' do
      before :each do
        put admin_page_category_path(category), page_category: { name: 'new name' }
        category.reload
      end

      it 'updates the category' do
        expect(category.name).to eq 'new name'
      end

      it 'redirects to the updated category' do
        expect(response).to redirect_to admin_page_category_path(category)
      end
    end

    context 'with invalid params' do
      it 'doesnt update the category' do
        expect {
          put admin_page_category_path(category), page_category: { name: '' }
        }.to_not change{ category.reload.name }
      end

      it 're-renders the edit method' do
        put admin_page_category_path(category), page_category: { name: '' }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE category' do
    let(:category) { create(:page_category) }

    it 'goes back to category index' do
      delete admin_page_category_path(category)
      expect(response).to redirect_to admin_page_categories_path
    end
  end
end
