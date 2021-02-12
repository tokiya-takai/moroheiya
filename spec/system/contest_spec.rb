require 'rails_helper'

RSpec.describe "User", type: :system do
  test_text = Faker::Lorem.sentence
  before do
    # ログイン状態にする
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
  end

  it "contest作成" do
    #新規投稿画面に遷移
    visit new_contest_path
    # タイトルを入力
    fill_in :title, with: test_text
    # ジャンルを選択
    find('#contest-genre').find("option[value='2']").select_option
    # カテゴリを選択
    find('#contest-category').find("option[value='2']").select_option
    # 説明を選択
    fill_in :content, with: test_text
    # 締め切りを選択
    find('#contest_deadline_1i').find("option[value='2022']").select_option
    find('#contest_deadline_2i').find("option[value='1']").select_option
    find('#contest_deadline_3i').find("option[value='1']").select_option
    find('#contest-hour').find("option[value='010000']").select_option
    # 画像をアタッチ
    image_path = Rails.root.join('public/images/test_image.png')
    attach_file('contest[image]', image_path, make_visible: true)
    # 投稿(コンテスト開催)ボタンを押下
    find('input[name="commit"]').click
    # 投稿完了ページへの遷移を確認
    expect(page).to have_content 'コンテストを開催しました！'
  end

  it "contest編集" do
    # コンテストにユーザーIDを紐付ける
    contest = FactoryBot.create(:contest, user_id: @user.id)
    # コンテスト編集画面へ遷移
    visit edit_contest_path(contest.id)
    # 締め切りを選択(締切の選択状態は保存されていないため)
    find('#contest_deadline_1i').find("option[value='2022']").select_option
    find('#contest_deadline_2i').find("option[value='1']").select_option
    find('#contest_deadline_3i').find("option[value='1']").select_option
    find('#contest-hour').find("option[value='010000']").select_option
    # 保存(更新する)ボタンを押下
    find('input[name="commit"]').click
    # 投稿完了ページへの遷移を確認
    expect(page).to have_content '編集が完了しました！'
  end
end