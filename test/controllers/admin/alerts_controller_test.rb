require 'test_helper'

class Admin::AlertsControllerTest < ActionController::TestCase
  setup do
    @admin_alert = admin_alerts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_alerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_alert" do
    assert_difference('Admin::Alert.count') do
      post :create, admin_alert: { category: @admin_alert.category, deadline: @admin_alert.deadline, description: @admin_alert.description, email: @admin_alert.email, price: @admin_alert.price, status: @admin_alert.status }
    end

    assert_redirected_to admin_alert_path(assigns(:admin_alert))
  end

  test "should show admin_alert" do
    get :show, id: @admin_alert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_alert
    assert_response :success
  end

  test "should update admin_alert" do
    patch :update, id: @admin_alert, admin_alert: { category: @admin_alert.category, deadline: @admin_alert.deadline, description: @admin_alert.description, email: @admin_alert.email, price: @admin_alert.price, status: @admin_alert.status }
    assert_redirected_to admin_alert_path(assigns(:admin_alert))
  end

  test "should destroy admin_alert" do
    assert_difference('Admin::Alert.count', -1) do
      delete :destroy, id: @admin_alert
    end

    assert_redirected_to admin_alerts_path
  end
end
