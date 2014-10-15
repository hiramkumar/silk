require 'test_helper'

class LoomsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:looms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loom" do
    assert_difference('Loom.count') do
      post :create, :loom => { }
    end

    assert_redirected_to loom_path(assigns(:loom))
  end

  test "should show loom" do
    get :show, :id => looms(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => looms(:one).id
    assert_response :success
  end

  test "should update loom" do
    put :update, :id => looms(:one).id, :loom => { }
    assert_redirected_to loom_path(assigns(:loom))
  end

  test "should destroy loom" do
    assert_difference('Loom.count', -1) do
      delete :destroy, :id => looms(:one).id
    end

    assert_redirected_to looms_path
  end
end
