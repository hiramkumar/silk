require 'test_helper'

class WeavesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weaves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weave" do
    assert_difference('Weave.count') do
      post :create, :weave => { }
    end

    assert_redirected_to weave_path(assigns(:weave))
  end

  test "should show weave" do
    get :show, :id => weaves(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => weaves(:one).id
    assert_response :success
  end

  test "should update weave" do
    put :update, :id => weaves(:one).id, :weave => { }
    assert_redirected_to weave_path(assigns(:weave))
  end

  test "should destroy weave" do
    assert_difference('Weave.count', -1) do
      delete :destroy, :id => weaves(:one).id
    end

    assert_redirected_to weaves_path
  end
end
