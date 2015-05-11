class ItemsController < ApplicationController
  before_action :set_list, only: [:create]

  def create
    @item = @list.items.create item_params
    respond_to do |format|
      format.html {
        if @item.persisted?
          redirect_to list_url(@list.list_uuid), notice: 'An item was successfully created.'
        else
          redirect_to list_url(@list.list_uuid), alert: 'An item was not successfully created.'
        end
      }
    end
  end

  private
    def item_params
      params.require(:item).permit(:title)
    end
end
