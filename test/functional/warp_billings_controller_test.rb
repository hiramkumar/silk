require 'test_helper'

class WarpBillingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warp_billings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warp_billing" do
    assert_difference('WarpBilling.count') do
      post :create, :warp_billing => { }
    end

    assert_redirected_to warp_billing_path(assigns(:warp_billing))
  end

  test "should show warp_billing" do
    get :show, :id => warp_billings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => warp_billings(:one).id
    assert_response :success
  end

  test "should update warp_billing" do
    put :update, :id => warp_billings(:one).id, :warp_billing => { }
    assert_redirected_to warp_billing_path(assigns(:warp_billing))
  end

  test "should destroy warp_billing" do
    assert_difference('WarpBilling.count', -1) do
      delete :destroy, :id => warp_billings(:one).id
    end

    assert_redirected_to warp_billings_path
  end
end
