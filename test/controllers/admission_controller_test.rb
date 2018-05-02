require 'test_helper'

class AdmissionControllerTest < ActionDispatch::IntegrationTest
  test "should get master_degree" do
    get admission_master_degree_url
    assert_response :success
  end

  test "should get bachalor_degree" do
    get admission_bachalor_degree_url
    assert_response :success
  end

  test "should get college" do
    get admission_college_url
    assert_response :success
  end

  test "should get exchange_program" do
    get admission_exchange_program_url
    assert_response :success
  end

  test "should get foreign_students" do
    get admission_foreign_students_url
    assert_response :success
  end

end
