require 'rails_helper'

RSpec.describe Api::ItemsController, type: :request do
  before do
    post  '/api/lists',
          format: :json,
          title: 'sample list',
          items: 'item1,item2'
  end

  let(:a_list) { List.first }
  let(:an_item) { a_list.items.first }

  describe 'PATCH item' do
    context 'when an item is not checked' do
      it 'check the item' do
        patch "/api/lists/#{a_list.list_uuid}/items/#{an_item.id}",
              format: :json,
              checked: 'true'
        json = JSON.parse response.body
        expect(json['item']['checked']).to eq(true)
      end
    end

    context 'when an item is checked' do
      it 'uncheck the item' do
        an_item.update_attribute :checked, true
        patch "/api/lists/#{a_list.list_uuid}/items/#{an_item.id}",
              format: :json,
              checked: 'false'
        json = JSON.parse response.body
        expect(json['item']['checked']).to eq(false)
      end
    end
  end
end
