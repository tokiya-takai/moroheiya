class WorksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_contest, only: [:new, :create]


  def new
    @work = Work.new
    if @contest.user_id == current_user.id
      redirect_to contest_path(@contest.id)
    end
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to root_path
    else
      @contest = Contest.find(params[:contest_id])
      render :new
    end
  end

  private
  def work_params
    params.require(:work).permit(:title,:content,:files).merge(contest_id: @contest.id, user_id: current_user.id)
  end

  def find_contest
    @contest = Contest.find(params[:contest_id])
  end
end