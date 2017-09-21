require 'test_helper'

class AccountpayableImportsControllerTest < ActionController::TestCase
  setup do
    @accountpayable_import = accountpayable_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accountpayable_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accountpayable_import" do
    assert_difference('AccountpayableImport.count') do
      post :create, accountpayable_import: {  }
    end

    assert_redirected_to accountpayable_import_path(assigns(:accountpayable_import))
  end

  test "should show accountpayable_import" do
    get :show, id: @accountpayable_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accountpayable_import
    assert_response :success
  end

  test "should update accountpayable_import" do
    patch :update, id: @accountpayable_import, accountpayable_import: {  }
    assert_redirected_to accountpayable_import_path(assigns(:accountpayable_import))
  end

  test "should destroy accountpayable_import" do
    assert_difference('AccountpayableImport.count', -1) do
      delete :destroy, id: @accountpayable_import
    end

    assert_redirected_to accountpayable_imports_path
  end
end
