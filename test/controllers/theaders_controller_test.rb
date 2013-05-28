require 'test_helper'

class TheadersControllerTest < ActionController::TestCase
  setup do
    @theader = theaders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:theaders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create theader" do
    assert_difference('Theader.count') do
      post :create, theader: { _title: @theader._title, direction: @theader.direction, heads: @theader.heads, intro: @theader.intro, items: @theader.items, length: @theader.length, title: @theader.title, type: @theader.type, user_id: @theader.user_id }
    end

    assert_redirected_to theader_path(assigns(:theader))
  end

  test "should show theader" do
    get :show, id: @theader
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @theader
    assert_response :success
  end

  test "should update theader" do
    patch :update, id: @theader, theader: { _title: @theader._title, direction: @theader.direction, heads: @theader.heads, intro: @theader.intro, items: @theader.items, length: @theader.length, title: @theader.title, type: @theader.type, user_id: @theader.user_id }
    assert_redirected_to theader_path(assigns(:theader))
  end

  test "should destroy theader" do
    assert_difference('Theader.count', -1) do
      delete :destroy, id: @theader
    end

    assert_redirected_to theaders_path
  end
end
