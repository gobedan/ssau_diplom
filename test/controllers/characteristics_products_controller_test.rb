require "test_helper"

class CharacteristicsProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @characteristics_product = characteristics_products(:one)
  end

  test "should get index" do
    get characteristics_products_url
    assert_response :success
  end

  test "should get new" do
    get new_characteristics_product_url
    assert_response :success
  end

  test "should create characteristics_product" do
    assert_difference('CharacteristicsProduct.count') do
      post characteristics_products_url, params: { characteristics_product: {  } }
    end

    assert_redirected_to characteristics_product_url(CharacteristicsProduct.last)
  end

  test "should show characteristics_product" do
    get characteristics_product_url(@characteristics_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_characteristics_product_url(@characteristics_product)
    assert_response :success
  end

  test "should update characteristics_product" do
    patch characteristics_product_url(@characteristics_product), params: { characteristics_product: {  } }
    assert_redirected_to characteristics_product_url(@characteristics_product)
  end

  test "should destroy characteristics_product" do
    assert_difference('CharacteristicsProduct.count', -1) do
      delete characteristics_product_url(@characteristics_product)
    end

    assert_redirected_to characteristics_products_url
  end
end
