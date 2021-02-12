require 'rails_helper'

RSpec.describe "User", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  
  it "user signup" do
    @user.birthday = ""
    visit new_user_registration_path
    fill_in 'nickname', with: @user.nickname
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    fill_in 'password-confirmation', with: @user.password
    fill_in 'family-name', with: @user.family_name
    fill_in 'first-name', with: @user.first_name
    fill_in 'family-name-kana', with: @user.family_name_kana
    fill_in 'first-name-kana', with: @user.first_name_kana
    find("#user_birthday_1i").find("option[value='2000']").select_option
    find("#user_birthday_2i").find("option[value='1']").select_option
    find("#user_birthday_3i").find("option[value='1']").select_option
    find('input[name="commit"]').click
    expect(current_path).to eq users_sign_up_confirm_path
    find('input[name="commit"]').click
    expect(page).to have_content '登録が完了しました！'
  end

  it "user signin" do
    @user.save
    visit new_user_session_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
  end

  it "user edit" do
    @user.save
    visit new_user_session_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    visit edit_user_registration_path
    find('input[name="commit"]').click
    expect(current_path).to eq user_path(@user.id)
  end
end