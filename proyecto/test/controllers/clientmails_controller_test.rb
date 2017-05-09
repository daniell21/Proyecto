require 'test_helper'

class ClientmailsControllerTest < ActionController::TestCase
  setup do
    @clientmail = clientmails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientmails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clientmail" do
    assert_difference('Clientmail.count') do
      post :create, clientmail: { body: @clientmail.body, client_id: @clientmail.client_id, title: @clientmail.title }
    end

    assert_redirected_to clientmail_path(assigns(:clientmail))
  end

  test "should show clientmail" do
    get :show, id: @clientmail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clientmail
    assert_response :success
  end

  test "should update clientmail" do
    patch :update, id: @clientmail, clientmail: { body: @clientmail.body, client_id: @clientmail.client_id, title: @clientmail.title }
    assert_redirected_to clientmail_path(assigns(:clientmail))
  end

  test "should destroy clientmail" do
    assert_difference('Clientmail.count', -1) do
      delete :destroy, id: @clientmail
    end

    assert_redirected_to clientmails_path
  end
end
