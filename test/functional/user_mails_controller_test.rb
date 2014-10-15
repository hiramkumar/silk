require 'test_helper'

class UserMailsControllerTest < ActionController::TestCase
  setup do
    @user_mail = user_mails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_mails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_mail" do
    assert_difference('UserMail.count') do
      post :create, :user_mail => @user_mail.attributes
    end

    assert_redirected_to user_mail_path(assigns(:user_mail))
  end

  test "should show user_mail" do
    get :show, :id => @user_mail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_mail.to_param
    assert_response :success
  end

  test "should update user_mail" do
    put :update, :id => @user_mail.to_param, :user_mail => @user_mail.attributes
    assert_redirected_to user_mail_path(assigns(:user_mail))
  end

  test "should destroy user_mail" do
    assert_difference('UserMail.count', -1) do
      delete :destroy, :id => @user_mail.to_param
    end

    assert_redirected_to user_mails_path
  end
end
