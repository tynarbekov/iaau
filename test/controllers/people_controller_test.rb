require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get faculty_advisors" do
    get people_faculty_advisors_url
    assert_response :success
  end

  test "should get alumni" do
    get people_alumni_url
    assert_response :success
  end

  test "should get students_groups" do
    get people_students_groups_url
    assert_response :success
  end

  test "should get lecturers" do
    get people_lecturers_url
    assert_response :success
  end

  test "should get prospective_students" do
    get people_prospective_students_url
    assert_response :success
  end

end
