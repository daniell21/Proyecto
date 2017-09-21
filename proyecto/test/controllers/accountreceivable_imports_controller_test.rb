require 'test_helper'

class AccountreceivableImportsControllerTest < ActionController::TestCase
  setup do
    @accountreceivable_import = accountreceivable_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accountreceivable_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accountreceivable_import" do
    assert_difference('AccountreceivableImport.count') do
      post :create, accountreceivable_import: {  }
    end

    assert_redirected_to accountreceivable_import_path(assigns(:accountreceivable_import))
  end

  test "should show accountreceivable_import" do
    get :show, id: @accountreceivable_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accountreceivable_import
    assert_response :success
  end

  test "should update accountreceivable_import" do
    patch :update, id: @accountreceivable_import, accountreceivable_import: {  }
    assert_redirected_to accountreceivable_import_path(assigns(:accountreceivable_import))
  end

  test "should destroy accountreceivable_import" do
    assert_difference('AccountreceivableImport.count', -1) do
      delete :destroy, id: @accountreceivable_import
    end

    assert_redirected_to accountreceivable_imports_path
  end
end
