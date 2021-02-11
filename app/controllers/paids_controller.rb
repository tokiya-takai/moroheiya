class PaidsController < ApplicationController
  before_action :set_variables

  def add_paid
    type = params[:type]
    @flag = ["false", ""]
    case type
    when "black"
      if @user.black_favorite == 0 || @user.black_favorite == nil
        return
      end
      black = current_user.blacks.new(work_id: @work.id)
      black.save!
      @user.black_favorite -= 1
      @user.save!
      @flag = ["true", "black"]

    when "gold"
      if @user.gold_favorite == 0 || @user.gold_favorite == nil
        return
      end
      gold = current_user.golds.new(work_id: @work.id)
      gold.save!
      @user.gold_favorite -= 1
      @user.save!
      @flag = ["true", "gold"]

    when "purple"
      if @user.purple_favorite == 0 || @user.purple_favorite == nil
        return
      end
      purple = current_user.purples.new(work_id: @work.id)
      purple.save!
      @user.purple_favorite -= 1
      @user.save!
      @flag = ["true", "purple"]
    else
      redirect_to root_path
    end
  end

  private

  def set_variables
    @work = Work.find(params[:work_id])
    @contest = Contest.find(@work.contest.id)
    @user = User.find(current_user.id)
  end

end
