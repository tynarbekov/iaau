require 'test_helper'

class StudentAttendancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_attendance = student_attendances(:one)
  end

  test "should get index" do
    get student_attendances_url
    assert_response :success
  end

  test "should get new" do
    get new_student_attendance_url
    assert_response :success
  end

  test "should create student_attendance" do
    assert_difference('StudentAttendance.count') do
      post student_attendances_url, params: { student_attendance: { schedule_id: @student_attendance.schedule_id, user_id: @student_attendance.user_id } }
    end

    assert_redirected_to student_attendance_url(StudentAttendance.last)
  end

  test "should show student_attendance" do
    get student_attendance_url(@student_attendance)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_attendance_url(@student_attendance)
    assert_response :success
  end

  test "should update student_attendance" do
    patch student_attendance_url(@student_attendance), params: { student_attendance: { schedule_id: @student_attendance.schedule_id, user_id: @student_attendance.user_id } }
    assert_redirected_to student_attendance_url(@student_attendance)
  end

  test "should destroy student_attendance" do
    assert_difference('StudentAttendance.count', -1) do
      delete student_attendance_url(@student_attendance)
    end

    assert_redirected_to student_attendances_url
  end
end
