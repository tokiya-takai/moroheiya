require 'rails_helper'

RSpec.describe "User", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  
  it "user 新規登録" do
    # 誕生日は選択するためFactoryBotのテストデータを消去
    @user.birthday = ""
    # 新規登録画面へ遷移
    visit new_user_registration_path
    # 情報を入力
    fill_in 'nickname', with: @user.nickname
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    fill_in 'password-confirmation', with: @user.password
    fill_in 'family-name', with: @user.family_name
    fill_in 'first-name', with: @user.first_name
    fill_in 'family-name-kana', with: @user.family_name_kana
    fill_in 'first-name-kana', with: @user.first_name_kana
    # 誕生日を選択
    find("#user_birthday_1i").find("option[value='2000']").select_option
    find("#user_birthday_2i").find("option[value='1']").select_option
    find("#user_birthday_3i").find("option[value='1']").select_option
    # 確認画面へボタンを押下
    find('input[name="commit"]').click
    # 確認画面を遷移していることを確認
    expect(current_path).to eq users_sign_up_confirm_path
    # 新規登録ボタンを押下
    find('input[name="commit"]').click
    # 登録完了ページへ遷移していることを確認
    expect(page).to have_content '登録が完了しました！'
  end

  it "user ログイン" do
    # ユーザーデータを保存
    @user.save
    # ログインページへ遷移
    visit new_user_session_path
    # 情報を入力
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    # ログインボタンを押下
    find('input[name="commit"]').click
    # トップページへ遷移していることを確認
    expect(current_path).to eq root_path
  end

  it "user 編集" do
    # ログイン
    @user.save
    visit new_user_session_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # 編集ページへ遷移
    visit edit_user_registration_path
    # 保存ボタンを押下
    find('input[name="commit"]').click
    # ユーザー詳細ページへ遷移していることを確認
    expect(current_path).to eq user_path(@user.id)
  end
end