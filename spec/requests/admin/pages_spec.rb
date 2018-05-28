require 'rails_helper'

describe 'Pages' do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /admin/pages' do
    it 'succeds' do
      get admin_pages_path
      expect(response).to be_success
    end
  end

  describe 'GET /admin/pages/X' do
    let(:page) { create(:page) }

    before :each do
      get admin_page_path(page)
    end

    it 'gets the correct page' do
      expect(assigns(:page)).to eq page
    end

    it 'renders the show template' do
      expect(response).to render_template :show
    end
  end

  describe 'POST new page' do
    context 'rendering the template for new page' do
      it 'goes to the remplate' do
        get new_admin_page_path
        expect(response).to be_success
      end
    end

    context 'page only' do
      context 'with valid attributes' do
        it 'creates the new page' do
          expect {
            post '/admin/pages', page: attributes_for(:page)
          }.to change(Page, :count).by(1)
        end

        it 'redirects to the new page' do
          post '/admin/pages', page: attributes_for(:page)
          expect(response).to redirect_to admin_page_path(Page.last)
        end
      end

      context 'with invalid attributes' do
        it 'doesnt create the page' do
          expect {
            post '/admin/pages', page: attributes_for(:invalid_page)
          }.to_not change(Page, :count)
        end

        it 're-renders the new page template' do
          post '/admin/pages', page: attributes_for(:invalid_page)
          expect(response).to render_template :new
        end
      end
    end

    context 'with section' do
      context 'with valid attributes' do
        it 'creates a page with section' do
          expect {
            post '/admin/pages', page: attributes_for(:page, sections_attributes: [attributes_for(:section)])
          }.to change(Page, :count).by(1)
        end

        it 'redirects to the new page' do
          post '/admin/pages', page: attributes_for(:page, sections_attributes: [attributes_for(:section)])
          expect(response).to redirect_to admin_page_path(Page.last)
        end
      end

      context 'with invalid attributes' do
        it 'doesnt create the page' do
          expect {
            post '/admin/pages', page: attributes_for(:page, sections_attributes: [attributes_for(:invalid_section)])
          }.to_not change(Page, :count)
        end

        it 're-renders the new page template' do
          post '/admin/pages', page: attributes_for(:page, sections_attributes: [attributes_for(:invalid_section)])
          expect(response).to render_template :new
        end
      end
    end
  end

  describe 'PUT update page' do
    let(:page) { create(:page) }

    context 'with valid params' do
      before :each do
        put admin_page_path(page), page: { title: 'new title' }
        page.reload
      end

      it 'updates the page' do
        expect(page.title).to eq 'new title'
      end

      it 'redirects to the updated page' do
        expect(response).to redirect_to admin_page_path(page)
      end
    end

    context 'with invalid params' do
      it 'doesnt update the page' do
        expect {
          put admin_page_path(page), page: { title: '' }
        }.to_not change{ page.reload.title }
      end

      it 're-renders the edit method' do
        put admin_page_path(page), page: { title: '' }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE page' do
    let(:page) { create(:page) }

    it 'goes back to the page index' do
      delete admin_page_path(page)
      expect(response).to redirect_to admin_pages_path
    end
  end
end
