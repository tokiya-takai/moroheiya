class NormalsController < ApplicationController
  before_action :find_work

  def add_normal
    if current_user.normals.blank?
      @work.total_count += 1
      @work.save
    end
    normal = current_user.normals.new(work_id: @work.id)
    normal.save
  end

  private

  def find_work
    @work = Work.find(params[:work_id])
  end
end
