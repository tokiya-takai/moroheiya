class ContestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :list]
  before_action :find_contest, only: [:show, :edit, :update]

  def index
  end

  def new
    sleep(0.4)
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(contest_params)
    today = DateTime.new
    
    if @contest.save
      redirect_to root_path
    else
      render :new
    end
  end

  def list
    @contests = Contest.page(params[:page]).per(6)
  end

  def show
  end

  def edit
    if @contest.user.id != current_user.id
      render :show
    end
  end

  def update
    if @contest.update(contest_params)
      render :finished
    else
      render :edit
    end
  end

  def finished
  end


  private
  def find_contest
    @contest = Contest.find(params[:id])
  end

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
    begin
      deadline = DateTime.new(
        params[:contest]["deadline(1i)"].to_i,
        params[:contest]["deadline(2i)"].to_i,
        params[:contest]["deadline(3i)"].to_i,
        h,m,s
      )
    rescue
      deadline = 'error'
    end
    
    return deadline
  end
end
