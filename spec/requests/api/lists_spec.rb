require 'rails_helper'

RSpec.describe Api::ListsController, type: :request do
  describe 'Post lists' do
    it 'return the url of the new list' do
      post  '/api/lists',
            format: :json,
            title: 'sample list',
            items: 'item1,item2'
      list = List.all.first
      json = JSON.parse response.body
      expect(json['list']['url']).to eq("http://localhost:3000#{list_path(list.list_uuid)}")
    end

    context 'when list items is not empty' do
      it 'create a new list' do
        post  '/api/lists',
              format: :json,
              title: 'sample list',
              items: 'item1,item2'
        lists = List.all
        list = lists.first
        expect(lists.count).to eq(1)
        expect(list.title).to eq('sample list')
        expect(list.items.count).to eq(2)
        expect(list.items.map{|item| item.title}).to eq(['item1', 'item2'])
      end
    end

    context 'when list items is empty' do
      it 'create a new list' do
        post  '/api/lists',
              format: :json,
              title: 'sample list'
        lists = List.all
        list = lists.first
        expect(lists.count).to eq(1)
        expect(list.title).to eq('sample list')
        expect(list.items.count).to eq(0)
      end
    end
  end
end
