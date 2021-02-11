require 'rails_helper'

RSpec.describe Work, type: :model do
  before do
    contest = FactoryBot.create(:user)
    @work = FactoryBot.build(:work)
    binding.pry
  end

  describe "作品を新規投稿" do
    context "作品が投稿できるとき" do
      it "必要な情報があれば投稿できる" do
        expect(@work).to be_valid
      end
    end
    context "作品が投稿できないとき" do
    end
  end
end
