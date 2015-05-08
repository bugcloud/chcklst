class Api::ListsController < Api::ApplicationController
  def create
    items = params[:items].to_s.split(',')
    @list = List.create(
      title: params[:title],
      items_attributes: items.map{ |item| {title: item} }
    )
    respond_to do |format|
      if @list.persisted?
        format.json { render }
      else
        format.json {
          render json: false.to_json, status: 400
        }
      end
    end
  end
end
