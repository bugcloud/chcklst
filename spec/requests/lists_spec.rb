require 'rails_helper'

RSpec.describe ListsController, type: :request do
  before(:each) do
    post  '/api/lists',
          format: :json,
          title: 'sample list',
          items: 'item1,item2'
  end

  let(:a_list) { List.first }

  describe '#show' do
    it 'show the list' do
      get "/lists/#{a_list.list_uuid}"
      expect(response.body).to include('sample list')
      expect(response.body).to include('item1')
      expect(response.body).to include('item2')
    end
  end

  describe '#archive' do
    it 'archive the list' do
      delete "/lists/#{a_list.list_uuid}/archive"
      expect(response).to redirect_to(root_path)
      expect(a_list.reload.archived).to eq(true)
    end
  end
end
