require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do
    it "Redirects to login page" do
      get 'show'
      response.should redirect_to '/users/sign_in'
    end
  end
end
