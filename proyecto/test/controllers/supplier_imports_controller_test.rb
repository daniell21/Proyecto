require 'test_helper'

class SupplierImportsControllerTest < ActionController::TestCase
  setup do
    @supplier_import = supplier_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supplier_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplier_import" do
    assert_difference('SupplierImport.count') do
      post :create, supplier_import: {  }
    end

    assert_redirected_to supplier_import_path(assigns(:supplier_import))
  end

  test "should show supplier_import" do
    get :show, id: @supplier_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplier_import
    assert_response :success
  end

  test "should update supplier_import" do
    patch :update, id: @supplier_import, supplier_import: {  }
    assert_redirected_to supplier_import_path(assigns(:supplier_import))
  end

  test "should destroy supplier_import" do
    assert_difference('SupplierImport.count', -1) do
      delete :destroy, id: @supplier_import
    end

    assert_redirected_to supplier_imports_path
  end
end
