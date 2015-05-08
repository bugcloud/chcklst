class Api::ItemsController < Api::ApplicationController
  before_action :set_list, only: [:update]

  def update
    @item = @list.items.find(params[:id])
    checked = params[:checked] == 'true'
    @item.update_attribute :checked, checked
  end
end
