class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    def set_list
      @list = List.where(archived: false).includes(:items).find_by(list_uuid: params[:list_uuid])
    end
end
