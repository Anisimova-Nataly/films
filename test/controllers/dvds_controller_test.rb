require 'test_helper'

class DvdsControllerTest < ActionController::TestCase
  setup do
    @dvd = dvds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dvds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dvd" do
    assert_difference('Dvd.count') do
      post :create, dvd: { amount: @dvd.amount, cover_content_type: @dvd.cover_content_type, cover_file_name: @dvd.cover_file_name, cover_file_size: @dvd.cover_file_size, cover_updated_at: @dvd.cover_updated_at, film_id: @dvd.film_id, name: @dvd.name, price: @dvd.price }
    end

    assert_redirected_to dvd_path(assigns(:dvd))
  end

  test "should show dvd" do
    get :show, id: @dvd
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dvd
    assert_response :success
  end

  test "should update dvd" do
    patch :update, id: @dvd, dvd: { amount: @dvd.amount, cover_content_type: @dvd.cover_content_type, cover_file_name: @dvd.cover_file_name, cover_file_size: @dvd.cover_file_size, cover_updated_at: @dvd.cover_updated_at, film_id: @dvd.film_id, name: @dvd.name, price: @dvd.price }
    assert_redirected_to dvd_path(assigns(:dvd))
  end

  test "should destroy dvd" do
    assert_difference('Dvd.count', -1) do
      delete :destroy, id: @dvd
    end

    assert_redirected_to dvds_path
  end
end
