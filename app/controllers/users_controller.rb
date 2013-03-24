class UsersController < ApplicationController

  before_filter :authenticate_user!
  caches_action :show, cache_path: proc {{ tag: User.find(params[:id]).updated_at.to_i }}

  def show
    @user = User.find(params[:id])
  end
end
