require 'rails_helper'

RSpec.describe "User", type: :system do
  test_text = Faker::Lorem.sentence
  before do
    # ログイン状態にする
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
    @contest = FactoryBot.create(:contest)
  end

  it "work新規投稿" do
    # 作品新規投稿ページへ遷移
    visit new_contest_work_path(@contest.id)
    # タイトルを入力
    fill_in 'title', with: test_text
    # 説明を入力
    fill_in 'content', with: test_text
    # 画像を選択
    image_path = Rails.root.join('public/images/test_image.png')
    attach_file('work[image]', image_path, make_visible: true)
    # 投稿するボタンを押下
    find("input[name='commit']").click
    # 投稿完了ページへの遷移を確認
    expect(page).to have_content "作品を投稿しました！"
  end

  it "work編集" do
    # 作品を作成
    @work = FactoryBot.create(:work, user_id: @user.id,contest_id: @contest.id)
    # 作品編集ページへ遷移
    visit edit_contest_work_path(@contest.id, @work.id)
    # 投稿するボタンを押下
    find("input[name='commit']").click
    # 編集完了ページへの遷移を確認
    expect(page).to have_content "編集が完了しました！"
  end
end