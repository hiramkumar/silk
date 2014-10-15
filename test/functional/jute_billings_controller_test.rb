require 'test_helper'

class JuteBillingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jute_billings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jute_billing" do
    assert_difference('JuteBilling.count') do
      post :create, :jute_billing => { }
    end

    assert_redirected_to jute_billing_path(assigns(:jute_billing))
  end

  test "should show jute_billing" do
    get :show, :id => jute_billings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => jute_billings(:one).id
    assert_response :success
  end

  test "should update jute_billing" do
    put :update, :id => jute_billings(:one).id, :jute_billing => { }
    assert_redirected_to jute_billing_path(assigns(:jute_billing))
  end

  test "should destroy jute_billing" do
    assert_difference('JuteBilling.count', -1) do
      delete :destroy, :id => jute_billings(:one).id
    end

    assert_redirected_to jute_billings_path
  end
end
