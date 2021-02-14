class WorksController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :find_contest, only: [:new, :create, :show, :edit, :update]
  before_action :find_work, only: [:show, :edit, :update, :finished]

  require './app/lib/file_validation'

  def show
  end


  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if (@contest.genre_id == 3) && (@work.video.blank?)
      @work.valid?
      @work.errors[:base] << "動画が選択されていません。"
      render :new and return
    end

    if !(@work.image.blank?)
      case @contest.genre_id
      when 2
        filename = @work.image.filename.to_s
        unless FileValidation.check(filename)
          @work.valid?
          @work.errors[:base] << "画像のファイル形式でアップロードしてください。(png jpg bmp pict)"
          render :new and return
        end

      when 3
        filename = @work.image.filename.to_s
        flag = false
        @work.valid?
        unless FileValidation.check(filename)
          @work.errors[:base] << "画像のファイル形式でアップロードしてください。(png jpg bmp pict)"
          flag = true
        end
        filename = @work.video.filename.to_s
        unless filename.end_with?(".mp4")
          @work.errors[:base] << "動画はmp4形式でアップロードしてください。"
          flag = true
        end
        render :new and return if flag
      end
    end

    if @work.save
      render :finished
    else
      render :new
    end

  end

  def edit
    if @work.user_id != current_user.id
      redirect_to contest_work_path(@work.contest_id, @work.id)
    end
  end

  def update
    if @work.update(work_params)
      render :finished
    else
      render :edit
    end
  end

  def finished
  end


  private
  def work_params
    params.require(:work).permit(:title,:content,:image,:video).merge(contest_id: @contest.id, user_id: current_user.id)
  end

  def find_contest
    @contest = Contest.find(params[:contest_id])
  end

  def find_work
    @work = Work.find(params[:id])
  end
end
