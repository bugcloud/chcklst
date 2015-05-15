require 'rails_helper'

RSpec.describe ItemsController, type: :request do
  before(:each) do
    post  '/api/lists',
          format: :json,
          title: 'sample list'
  end

  let(:a_list) { List.first }

  describe '#create' do
    it 'add new item' do
      post "/lists/#{a_list.list_uuid}/items",
            item: {
              title: 'awesome new item'
            }
      expect(response).to redirect_to(list_path(a_list.list_uuid))
      expect(a_list.reload.items.first.title).to eq('awesome new item')
    end
  end
end
