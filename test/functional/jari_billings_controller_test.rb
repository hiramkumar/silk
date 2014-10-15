require 'test_helper'

class JariBillingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jari_billings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jari_billing" do
    assert_difference('JariBilling.count') do
      post :create, :jari_billing => { }
    end

    assert_redirected_to jari_billing_path(assigns(:jari_billing))
  end

  test "should show jari_billing" do
    get :show, :id => jari_billings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => jari_billings(:one).id
    assert_response :success
  end

  test "should update jari_billing" do
    put :update, :id => jari_billings(:one).id, :jari_billing => { }
    assert_redirected_to jari_billing_path(assigns(:jari_billing))
  end

  test "should destroy jari_billing" do
    assert_difference('JariBilling.count', -1) do
      delete :destroy, :id => jari_billings(:one).id
    end

    assert_redirected_to jari_billings_path
  end
end
