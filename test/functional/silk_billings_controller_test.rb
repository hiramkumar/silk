require 'test_helper'

class SilkBillingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:silk_billings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create silk_billing" do
    assert_difference('SilkBilling.count') do
      post :create, :silk_billing => { }
    end

    assert_redirected_to silk_billing_path(assigns(:silk_billing))
  end

  test "should show silk_billing" do
    get :show, :id => silk_billings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => silk_billings(:one).id
    assert_response :success
  end

  test "should update silk_billing" do
    put :update, :id => silk_billings(:one).id, :silk_billing => { }
    assert_redirected_to silk_billing_path(assigns(:silk_billing))
  end

  test "should destroy silk_billing" do
    assert_difference('SilkBilling.count', -1) do
      delete :destroy, :id => silk_billings(:one).id
    end

    assert_redirected_to silk_billings_path
  end
end
