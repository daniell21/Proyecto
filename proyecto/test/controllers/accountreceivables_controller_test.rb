require 'test_helper'

class AccountreceivablesControllerTest < ActionController::TestCase
  setup do
    @accountreceivable = accountreceivables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accountreceivables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accountreceivable" do
    assert_difference('Accountreceivable.count') do
      post :create, accountreceivable: { client_id: @accountreceivable.client_id, descripcion: @accountreceivable.descripcion, total: @accountreceivable.total }
    end

    assert_redirected_to accountreceivable_path(assigns(:accountreceivable))
  end

  test "should show accountreceivable" do
    get :show, id: @accountreceivable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accountreceivable
    assert_response :success
  end

  test "should update accountreceivable" do
    patch :update, id: @accountreceivable, accountreceivable: { client_id: @accountreceivable.client_id, descripcion: @accountreceivable.descripcion, total: @accountreceivable.total }
    assert_redirected_to accountreceivable_path(assigns(:accountreceivable))
  end

  test "should destroy accountreceivable" do
    assert_difference('Accountreceivable.count', -1) do
      delete :destroy, id: @accountreceivable
    end

    assert_redirected_to accountreceivables_path
  end
end
