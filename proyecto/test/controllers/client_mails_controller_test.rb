require 'test_helper'

class ClientMailsControllerTest < ActionController::TestCase
  setup do
    @client_mail = client_mails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_mails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_mail" do
    assert_difference('ClientMail.count') do
      post :create, client_mail: { body: @client_mail.body, destinatary: @client_mail.destinatary, title: @client_mail.title }
    end

    assert_redirected_to client_mail_path(assigns(:client_mail))
  end

  test "should show client_mail" do
    get :show, id: @client_mail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_mail
    assert_response :success
  end

  test "should update client_mail" do
    patch :update, id: @client_mail, client_mail: { body: @client_mail.body, destinatary: @client_mail.destinatary, title: @client_mail.title }
    assert_redirected_to client_mail_path(assigns(:client_mail))
  end

  test "should destroy client_mail" do
    assert_difference('ClientMail.count', -1) do
      delete :destroy, id: @client_mail
    end

    assert_redirected_to client_mails_path
  end
end
