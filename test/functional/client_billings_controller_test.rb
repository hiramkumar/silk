require 'test_helper'

class ClientBillingsControllerTest < ActionController::TestCase
  setup do
    @client_billing = client_billings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_billings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_billing" do
    assert_difference('ClientBilling.count') do
      post :create, :client_billing => @client_billing.attributes
    end

    assert_redirected_to client_billing_path(assigns(:client_billing))
  end

  test "should show client_billing" do
    get :show, :id => @client_billing.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @client_billing.to_param
    assert_response :success
  end

  test "should update client_billing" do
    put :update, :id => @client_billing.to_param, :client_billing => @client_billing.attributes
    assert_redirected_to client_billing_path(assigns(:client_billing))
  end

  test "should destroy client_billing" do
    assert_difference('ClientBilling.count', -1) do
      delete :destroy, :id => @client_billing.to_param
    end

    assert_redirected_to client_billings_path
  end
end
