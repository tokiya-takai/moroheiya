class NormalsController < ApplicationController
  before_action :set_variables

  def add_normal
    normal = current_user.normals.new(work_id: @work.id)
    normal.save
  end

  private

  def set_variables
    @work = Work.find(params[:work_id])
    @id_name = "#normal-link-#{@work.id}"
  end
end
