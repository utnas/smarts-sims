require 'test_helper'

class DivorcesControllerTest < ActionController::TestCase
  setup do
    @divorce = divorces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:divorces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create divorce" do
    assert_difference('Divorce.count') do
      post :create, divorce: { first_person_id: @divorce.first_person_id, integer: @divorce.integer, second_person_id: @divorce.second_person_id }
    end

    assert_redirected_to divorce_path(assigns(:divorce))
  end

  test "should show divorce" do
    get :show, id: @divorce
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @divorce
    assert_response :success
  end

  test "should update divorce" do
    put :update, id: @divorce, divorce: { first_person_id: @divorce.first_person_id, integer: @divorce.integer, second_person_id: @divorce.second_person_id }
    assert_redirected_to divorce_path(assigns(:divorce))
  end

  test "should destroy divorce" do
    assert_difference('Divorce.count', -1) do
      delete :destroy, id: @divorce
    end

    assert_redirected_to divorces_path
  end
end
