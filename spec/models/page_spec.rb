require 'rails_helper'

describe Page do
  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'associations' do
    it { should belong_to(:page_category) }
    it { should have_many(:sections) }
  end
end
