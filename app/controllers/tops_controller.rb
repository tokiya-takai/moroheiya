class TopsController < ApplicationController
  def index
    @contest = Contest.all
  end
end
