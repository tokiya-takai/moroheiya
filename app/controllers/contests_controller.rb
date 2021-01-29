class ContestsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    sleep(0.4)
  end
end
