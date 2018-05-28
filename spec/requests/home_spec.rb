require 'rails_helper'

describe 'Home' do
  it 'succeds' do
    get root_path
    expect(response).to be_success
  end
end
