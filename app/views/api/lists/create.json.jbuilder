json.set! :list do
  json.url "#{Rails.application.secrets.api_base_url}#{list_path(@list.list_uuid)}"
end
