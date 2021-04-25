require "application_system_test_case"

class CharacteristicsProductsTest < ApplicationSystemTestCase
  setup do
    @characteristics_product = characteristics_products(:one)
  end

  test "visiting the index" do
    visit characteristics_products_url
    assert_selector "h1", text: "Characteristics Products"
  end

  test "creating a Characteristics product" do
    visit characteristics_products_url
    click_on "New Characteristics Product"

    click_on "Create Characteristics product"

    assert_text "Characteristics product was successfully created"
    click_on "Back"
  end

  test "updating a Characteristics product" do
    visit characteristics_products_url
    click_on "Edit", match: :first

    click_on "Update Characteristics product"

    assert_text "Characteristics product was successfully updated"
    click_on "Back"
  end

  test "destroying a Characteristics product" do
    visit characteristics_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Characteristics product was successfully destroyed"
  end
end
