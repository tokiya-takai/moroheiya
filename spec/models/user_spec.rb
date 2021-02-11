require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "登録時に必要な情報がすべてあれば、登録できる。" do
        expect(@user).to be_valid
      end
      it "profileがなくても登録できる" do
        @user.profile = ""
        expect(@user).to be_valid
      end
      it "black_favoriteがなくても登録できる" do
        @user.black_favorite = ""
        expect(@user).to be_valid
      end
      it "gold_favoriteがなくても登録できる" do
        @user.gold_favorite = ""
        expect(@user).to be_valid
      end
      it "purple_favoriteがなくても登録できる" do
        @user.purple_favorite = ""
        expect(@user).to be_valid
      end
      it "count_firstがなくても登録できる" do
        @user.count_first = ""
        expect(@user).to be_valid
      end
      it "count_secondがなくても登録できる" do
        @user.count_second = ""
        expect(@user).to be_valid
      end
      it "count_thirdがなくても登録できる" do
        @user.count_third = ""
        expect(@user).to be_valid
      end
    end
    context "新規登録できないとき" do
      it "nicknameがなければ登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネーム が入力されていません。")
      end
      it "emailがなければ登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレス が入力されていません。")
      end
      it "passwordがなければ登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード が入力されていません。")
      end
      it "password_confirmationがなければ登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワード が一致していません。")
      end
      it "family_nameがなければ登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字 が入力されていません。")
      end
      it "first_nameがなければ登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前 が入力されていません。")
      end
      it "family_name_kanaがなければ登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(フリガナ) が入力されていません。")
      end
      it "first_name_kanaがなければ登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(フリガナ) が入力されていません。")
      end
      it "birthdayがなければ登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日 が入力されていません。")
      end
      it "family_nameが全角日本語以外は登録できない" do
        @user.family_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字 は有効でありません。")
      end
      it "first_nameが全角日本語以外は登録できない" do
        @user.first_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前 は有効でありません。")
      end
      it "family_name_kanaが全角カタカナ以外は登録できない" do
        @user.family_name_kana = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(フリガナ) は有効でありません。")
      end
      it "first_name_kanaが全角カタカナ以外は登録できない" do
        @user.first_name_kana = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(フリガナ) は有効でありません。")
      end
    end
  end
end
