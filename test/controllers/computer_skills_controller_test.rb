require 'test_helper'

class ComputerSkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computer_skill = computer_skills(:one)
  end

  test "should get index" do
    get computer_skills_url
    assert_response :success
  end

  test "should get new" do
    get new_computer_skill_url
    assert_response :success
  end

  test "should create computer_skill" do
    assert_difference('ComputerSkill.count') do
      post computer_skills_url, params: { computer_skill: {  } }
    end

    assert_redirected_to computer_skill_url(ComputerSkill.last)
  end

  test "should show computer_skill" do
    get computer_skill_url(@computer_skill)
    assert_response :success
  end

  test "should get edit" do
    get edit_computer_skill_url(@computer_skill)
    assert_response :success
  end

  test "should update computer_skill" do
    patch computer_skill_url(@computer_skill), params: { computer_skill: {  } }
    assert_redirected_to computer_skill_url(@computer_skill)
  end

  test "should destroy computer_skill" do
    assert_difference('ComputerSkill.count', -1) do
      delete computer_skill_url(@computer_skill)
    end

    assert_redirected_to computer_skills_url
  end
end
