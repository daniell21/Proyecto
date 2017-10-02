require 'test_helper'

class ApiusersControllerTest < ActionController::TestCase
  setup do
    @apiuser = apiusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apiusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apiuser" do
    assert_difference('Apiuser.count') do
      post :create, apiuser: { email: @apiuser.email, password: @apiuser.password }
    end

    assert_redirected_to apiuser_path(assigns(:apiuser))
  end

  test "should show apiuser" do
    get :show, id: @apiuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apiuser
    assert_response :success
  end

  test "should update apiuser" do
    patch :update, id: @apiuser, apiuser: { email: @apiuser.email, password: @apiuser.password }
    assert_redirected_to apiuser_path(assigns(:apiuser))
  end

  test "should destroy apiuser" do
    assert_difference('Apiuser.count', -1) do
      delete :destroy, id: @apiuser
    end

    assert_redirected_to apiusers_path
  end
end
