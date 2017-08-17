require 'test_helper'

class ConstantsControllerTest < ActionController::TestCase
  setup do
    @constant = constants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:constants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create constant" do
    assert_difference('Constant.count') do
      post :create, constant: { amount: @constant.amount, name: @constant.name }
    end

    assert_redirected_to constant_path(assigns(:constant))
  end

  test "should show constant" do
    get :show, id: @constant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @constant
    assert_response :success
  end

  test "should update constant" do
    patch :update, id: @constant, constant: { amount: @constant.amount, name: @constant.name }
    assert_redirected_to constant_path(assigns(:constant))
  end

  test "should destroy constant" do
    assert_difference('Constant.count', -1) do
      delete :destroy, id: @constant
    end

    assert_redirected_to constants_path
  end
end
