require 'test_helper'

class NewsEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get calendar_colloquia" do
    get news_events_calendar_colloquia_url
    assert_response :success
  end

  test "should get for_the_media" do
    get news_events_for_the_media_url
    assert_response :success
  end

  test "should get announcements" do
    get news_events_announcements_url
    assert_response :success
  end

end
