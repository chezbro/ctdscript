require 'test_helper'

class FontCategoriesControllerTest < ActionController::TestCase
  setup do
    @font_category = font_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:font_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create font_category" do
    assert_difference('FontCategory.count') do
      post :create, font_category: { name: @font_category.name, number_of_fonts: @font_category.number_of_fonts }
    end

    assert_redirected_to font_category_path(assigns(:font_category))
  end

  test "should show font_category" do
    get :show, id: @font_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @font_category
    assert_response :success
  end

  test "should update font_category" do
    patch :update, id: @font_category, font_category: { name: @font_category.name, number_of_fonts: @font_category.number_of_fonts }
    assert_redirected_to font_category_path(assigns(:font_category))
  end

  test "should destroy font_category" do
    assert_difference('FontCategory.count', -1) do
      delete :destroy, id: @font_category
    end

    assert_redirected_to font_categories_path
  end
end
