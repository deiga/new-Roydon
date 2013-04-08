require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do
    it "should redirect to login page" do
      get :show, id: Moped::BSON::ObjectId.new
      response.should redirect_to '/users/sign_in'
    end
  end
end
