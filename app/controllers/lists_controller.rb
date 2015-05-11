class ListsController < ApplicationController
  before_action :set_list, only: [:show, :archive]

  def show
    @new_item = Item.new(list: @list)
  end

  def archive
    message = nil
    if @list
      @list.update_attribute :archived, true
      message = 'A list has been successfully archived.'
    end
    redirect_to root_path, notice: message
  end
end
