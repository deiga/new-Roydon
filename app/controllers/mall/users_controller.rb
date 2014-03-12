module Mall
  class UsersController < Mall::ApplicationController

    before_filter :authenticate_user!
    respond_to :html

    def show
      @user = User.find(params[:id])
      stale? @user do
        respond_with @user
      end
    end
  end
end
