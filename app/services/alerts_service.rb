# Alert's Service
class AlertsService
  def latest_unread(count, _params = {})
    unread_alerts = Admin::Alert.where(status: Admin::Alert.statuses[:unread])
                                .where(validate_filters(_params))
                                .limit(count)
    alerts = unread_alerts.to_a
    unread_alerts.update_all(status: Admin::Alert.statuses[:read])

    alerts
  end

  private

  def validate_filters(params)
    filters = {}

    if params[:email].present?
      filters.merge(email: params[:email])
    elsif params[:email].present?
      filters.merge(price: params[:price])
    elsif params[:category].present?
      filters.merge(email: params[:email])
    end

    filters
  end
end
