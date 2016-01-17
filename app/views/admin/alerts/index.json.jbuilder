json.array!(@admin_alerts) do |admin_alert|
  json.extract! admin_alert, :id, :description, :category, :email, :price, :deadline, :status
  json.url admin_alert_url(admin_alert, format: :json)
end
