require 'rails_helper'

RSpec.describe Work, type: :model do
  before do
    user = FactoryBot.create(:user)
    contest = FactoryBot.create(:contest)
    @work = FactoryBot.build(:work, user_id: user.id, contest_id: contest.id)
  end

  describe "作品を新規投稿" do
    context "作品が投稿できるとき" do
      it "必要な情報があれば投稿できる" do
        expect(@work).to be_valid
      end
    end
    context "作品が投稿できないとき" do
      it "titleがなければ投稿できない" do
        @work.title = ""
        @work.valid?
        expect(@work.errors.full_messages).to include("タイトル が入力されていません。")
      end
      it "contentがなければ投稿できない" do
        @work.content = ""
        @work.valid?
        expect(@work.errors.full_messages).to include("説明 が入力されていません。")
      end
      it "imageがなければ投稿できない" do
        @work.image = nil
        @work.valid?
        expect(@work.errors.full_messages).to include("画像 が選択されていません。")
      end
      it "user_idがなければ投稿できない" do
        @work.user_id = ""
        @work.valid?
        expect(@work.errors.full_messages).to include("ユーザー が紐付いていません。")
      end
    end
  end
end
