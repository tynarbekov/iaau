require 'test_helper'

class ProffesionalSkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proffesional_skill = proffesional_skills(:one)
  end

  test "should get index" do
    get proffesional_skills_url
    assert_response :success
  end

  test "should get new" do
    get new_proffesional_skill_url
    assert_response :success
  end

  test "should create proffesional_skill" do
    assert_difference('ProffesionalSkill.count') do
      post proffesional_skills_url, params: { proffesional_skill: {  } }
    end

    assert_redirected_to proffesional_skill_url(ProffesionalSkill.last)
  end

  test "should show proffesional_skill" do
    get proffesional_skill_url(@proffesional_skill)
    assert_response :success
  end

  test "should get edit" do
    get edit_proffesional_skill_url(@proffesional_skill)
    assert_response :success
  end

  test "should update proffesional_skill" do
    patch proffesional_skill_url(@proffesional_skill), params: { proffesional_skill: {  } }
    assert_redirected_to proffesional_skill_url(@proffesional_skill)
  end

  test "should destroy proffesional_skill" do
    assert_difference('ProffesionalSkill.count', -1) do
      delete proffesional_skill_url(@proffesional_skill)
    end

    assert_redirected_to proffesional_skills_url
  end
end
