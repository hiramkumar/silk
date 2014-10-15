require 'test_helper'

class DyesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dyes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dye" do
    assert_difference('Dye.count') do
      post :create, :dye => { }
    end

    assert_redirected_to dye_path(assigns(:dye))
  end

  test "should show dye" do
    get :show, :id => dyes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dyes(:one).id
    assert_response :success
  end

  test "should update dye" do
    put :update, :id => dyes(:one).id, :dye => { }
    assert_redirected_to dye_path(assigns(:dye))
  end

  test "should destroy dye" do
    assert_difference('Dye.count', -1) do
      delete :destroy, :id => dyes(:one).id
    end

    assert_redirected_to dyes_path
  end
end
