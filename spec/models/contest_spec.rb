require 'rails_helper'

RSpec.describe Contest, type: :model do
  before do
    user = FactoryBot.create(:user)
    @contest = FactoryBot.build(:contest)
    @contest.user_id = user.id
  end

  describe "コンテスト作成" do
    context "コンテスト作成できるとき" do
      it "必要な情報があれば作成できる" do
        expect(@contest).to be_valid
      end
    end
    context "コンテスト作成できないとき" do
      it "titleがなければ作成できない" do
        @contest.title = ""
        @contest.valid?
        expect(@contest.errors.full_messages).to include("タイトル が入力されていません。")
      end
      it "genre_idが1だと登録できない" do
        @contest.genre_id = 1
        @contest.valid?
        expect(@contest.errors.full_messages).to include("ジャンル が選択されていません。")
      end
      it "genre_idが空だと登録できない" do
        @contest.genre_id = nil
        @contest.valid?
        expect(@contest.errors.full_messages).to include("ジャンル が入力されていません。")
      end
      it "category_idが1だと登録できない" do
        @contest.category_id = 1
        @contest.valid?
        expect(@contest.errors.full_messages).to include("カテゴリー が選択されていません。")
      end
      it "category_idが空だと登録できない" do
        @contest.category_id = nil
        @contest.valid?
        expect(@contest.errors.full_messages).to include("カテゴリー が入力されていません。")
      end
      it "contentがなければ作成できない" do
        @contest.content = ""
        @contest.valid?
        expect(@contest.errors.full_messages).to include("説明 が入力されていません。")
      end
      it "deadlineがなければ作成できない" do
        @contest.deadline = ""
        @contest.valid?
        expect(@contest.errors.full_messages).to include("締め切り が入力されていないか、存在しない日付です。")
      end
      it "deadlineが現在時刻より前だと作成できない" do
        @contest.deadline = DateTime.now - Rational(1, 24 * 60 * 60)
        @contest.valid?
        expect(@contest.errors.full_messages).to include("締め切りは現在時刻以降のものを選択してください。")
      end
      it "imageがなければ作成できない" do
        @contest.image = nil
        @contest.valid?
        expect(@contest.errors.full_messages).to include("サムネイル が選択されていません。")
      end
    end
  end
end
