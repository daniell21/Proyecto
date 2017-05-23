require 'test_helper'

class MailremindersControllerTest < ActionController::TestCase
  setup do
    @mailreminder = mailreminders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mailreminders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mailreminder" do
    assert_difference('Mailreminder.count') do
      post :create, mailreminder: { body: @mailreminder.body, title: @mailreminder.title }
    end

    assert_redirected_to mailreminder_path(assigns(:mailreminder))
  end

  test "should show mailreminder" do
    get :show, id: @mailreminder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mailreminder
    assert_response :success
  end

  test "should update mailreminder" do
    patch :update, id: @mailreminder, mailreminder: { body: @mailreminder.body, title: @mailreminder.title }
    assert_redirected_to mailreminder_path(assigns(:mailreminder))
  end

  test "should destroy mailreminder" do
    assert_difference('Mailreminder.count', -1) do
      delete :destroy, id: @mailreminder
    end

    assert_redirected_to mailreminders_path
  end
end
