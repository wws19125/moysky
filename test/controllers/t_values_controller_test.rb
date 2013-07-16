require 'test_helper'

class TValuesControllerTest < ActionController::TestCase
  setup do
    @t_value = t_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:t_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create t_value" do
    assert_difference('TValue.count') do
      post :create, t_value: { _title: @t_value._title, heads: @t_value.heads, items: @t_value.items, theader_id: @t_value.theader_id, title: @t_value.title }
    end

    assert_redirected_to t_value_path(assigns(:t_value))
  end

  test "should show t_value" do
    get :show, id: @t_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @t_value
    assert_response :success
  end

  test "should update t_value" do
    patch :update, id: @t_value, t_value: { _title: @t_value._title, heads: @t_value.heads, items: @t_value.items, theader_id: @t_value.theader_id, title: @t_value.title }
    assert_redirected_to t_value_path(assigns(:t_value))
  end

  test "should destroy t_value" do
    assert_difference('TValue.count', -1) do
      delete :destroy, id: @t_value
    end

    assert_redirected_to t_values_path
  end
end
