require 'test_helper'

class AccountpayablesControllerTest < ActionController::TestCase
  setup do
    @accountpayable = accountpayables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accountpayables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accountpayable" do
    assert_difference('Accountpayable.count') do
      post :create, accountpayable: { descripcion: @accountpayable.descripcion, supplier_id: @accountpayable.supplier_id, total: @accountpayable.total }
    end

    assert_redirected_to accountpayable_path(assigns(:accountpayable))
  end

  test "should show accountpayable" do
    get :show, id: @accountpayable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accountpayable
    assert_response :success
  end

  test "should update accountpayable" do
    patch :update, id: @accountpayable, accountpayable: { descripcion: @accountpayable.descripcion, supplier_id: @accountpayable.supplier_id, total: @accountpayable.total }
    assert_redirected_to accountpayable_path(assigns(:accountpayable))
  end

  test "should destroy accountpayable" do
    assert_difference('Accountpayable.count', -1) do
      delete :destroy, id: @accountpayable
    end

    assert_redirected_to accountpayables_path
  end
end
