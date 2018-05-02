require 'test_helper'

class OfficesServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get academic_programs" do
    get offices_services_academic_programs_url
    assert_response :success
  end

  test "should get human_resourse" do
    get offices_services_human_resourse_url
    assert_response :success
  end

  test "should get office_of_dean" do
    get offices_services_office_of_dean_url
    assert_response :success
  end

  test "should get exchange" do
    get offices_services_exchange_url
    assert_response :success
  end

  test "should get contacts" do
    get offices_services_contacts_url
    assert_response :success
  end

end
