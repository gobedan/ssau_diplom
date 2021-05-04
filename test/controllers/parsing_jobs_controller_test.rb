require "test_helper"

class ParsingJobsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get parsing_jobs_new_url
    assert_response :success
  end

  test "should get create" do
    get parsing_jobs_create_url
    assert_response :success
  end
end
