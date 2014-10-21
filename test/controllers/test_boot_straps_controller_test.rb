require 'test_helper'

class TestBootStrapsControllerTest < ActionController::TestCase
  setup do
    @test_boot_strap = test_boot_straps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_boot_straps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_boot_strap" do
    assert_difference('TestBootStrap.count') do
      post :create, test_boot_strap: { description: @test_boot_strap.description, title: @test_boot_strap.title }
    end

    assert_redirected_to test_boot_strap_path(assigns(:test_boot_strap))
  end

  test "should show test_boot_strap" do
    get :show, id: @test_boot_strap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_boot_strap
    assert_response :success
  end

  test "should update test_boot_strap" do
    patch :update, id: @test_boot_strap, test_boot_strap: { description: @test_boot_strap.description, title: @test_boot_strap.title }
    assert_redirected_to test_boot_strap_path(assigns(:test_boot_strap))
  end

  test "should destroy test_boot_strap" do
    assert_difference('TestBootStrap.count', -1) do
      delete :destroy, id: @test_boot_strap
    end

    assert_redirected_to test_boot_straps_path
  end
end
