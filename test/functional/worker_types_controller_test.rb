require 'test_helper'

class WorkerTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worker_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worker_type" do
    assert_difference('WorkerType.count') do
      post :create, :worker_type => { }
    end

    assert_redirected_to worker_type_path(assigns(:worker_type))
  end

  test "should show worker_type" do
    get :show, :id => worker_types(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => worker_types(:one).id
    assert_response :success
  end

  test "should update worker_type" do
    put :update, :id => worker_types(:one).id, :worker_type => { }
    assert_redirected_to worker_type_path(assigns(:worker_type))
  end

  test "should destroy worker_type" do
    assert_difference('WorkerType.count', -1) do
      delete :destroy, :id => worker_types(:one).id
    end

    assert_redirected_to worker_types_path
  end
end
