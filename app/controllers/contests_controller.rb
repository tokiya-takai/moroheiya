class ContestsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    sleep(0.4)
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(contest_params)
    if @contest.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def contest_params
    deadline = connect_deadline
    params.require(:contest).permit(:title,:genre_id,:category_id,:content,:image).merge(deadline: deadline, user_id: current_user.id)
  end

  def connect_deadline

    if ((params[:contest]["deadline(1i)"]) == "") || ((params[:contest]["deadline(2i)"]) == "") || ((params[:contest]["deadline(3i)"]) == "")
      return nil
    end

    time = params.require(:contest).permit(:hour)
    if time[:hour] == ""
      return nil
    end
    time = time[:hour]
    h = time[0,2].to_i
    m = time[2,2].to_i
    s = time[4,2].to_i
    deadline = DateTime.new(
      params[:contest]["deadline(1i)"].to_i,
      params[:contest]["deadline(2i)"].to_i,
      params[:contest]["deadline(3i)"].to_i,
      h,m,s
    )
    return deadline
  end
end
