require 'test_helper'

class FacultyResearchControllerTest < ActionDispatch::IntegrationTest
  test "should get graduate_research" do
    get faculty_research_graduate_research_url
    assert_response :success
  end

  test "should get research_interests" do
    get faculty_research_research_interests_url
    assert_response :success
  end

  test "should get centers_initiatives" do
    get faculty_research_centers_initiatives_url
    assert_response :success
  end

  test "should get undergraduate_research" do
    get faculty_research_undergraduate_research_url
    assert_response :success
  end

  test "should get masterworks" do
    get faculty_research_masterworks_url
    assert_response :success
  end

end
