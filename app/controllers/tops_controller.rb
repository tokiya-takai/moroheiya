class TopsController < ApplicationController
  def index
    @contests = Contest.limit(3).order("created_at DESC")
  end
end
