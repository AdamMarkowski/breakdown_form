require 'test_helper'

class AlertsServiceTest < ActiveSupport::TestCase
  test 'should return latest alerts' do
    10.times { create_alert }

    alerts = AlertsService.new
    assert_equal 10, alerts.latest_unread(10).count
  end

  test 'should return latest alerts filtered by email' do
    2.times { create_alert(nil, 'filtered@example.com') }

    alerts = AlertsService.new
    assert_equal 3, alerts.latest_unread(10, email: 'filtered@example.com').count
  end

  test 'should return latest alerts filtered by price' do
    3.times { create_alert(Admin::Alert.categories[:damage]) }

    alerts = AlertsService.new
    assert_equal 4, alerts.latest_unread(10, price: 10).count
  end

  test 'should return latest alerts filtered by category' do
    4.times { create_alert(Admin::Alert.categories[:breakdown]) }

    alerts = AlertsService.new
    assert_equal 5, alerts.latest_unread(10, category: 'breakdown').count
  end

  test 'should return latest alerts filtered by category, price and email' do
    1.times { create_alert(Admin::Alert.categories[:fault], 'filtered@ex.com') }

    alerts = AlertsService.new
    assert_equal 2, alerts.latest_unread(10, category: 'breakdown',
                                             email: 'filtered@ex.com',
                                             price: 1).count
  end
end
