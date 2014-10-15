require 'test_helper'

class CottonBillingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cotton_billings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cotton_billing" do
    assert_difference('CottonBilling.count') do
      post :create, :cotton_billing => { }
    end

    assert_redirected_to cotton_billing_path(assigns(:cotton_billing))
  end

  test "should show cotton_billing" do
    get :show, :id => cotton_billings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cotton_billings(:one).id
    assert_response :success
  end

  test "should update cotton_billing" do
    put :update, :id => cotton_billings(:one).id, :cotton_billing => { }
    assert_redirected_to cotton_billing_path(assigns(:cotton_billing))
  end

  test "should destroy cotton_billing" do
    assert_difference('CottonBilling.count', -1) do
      delete :destroy, :id => cotton_billings(:one).id
    end

    assert_redirected_to cotton_billings_path
  end
end
