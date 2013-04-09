require 'spec_helper'

describe UsersController do
  render_views

  let(:user) { FactoryGirl.create(:user) }

  describe "GET 'show'" do
    it "should redirect to login page" do
      get :show, id: Moped::BSON::ObjectId.new
      response.should redirect_to '/users/sign_in'
    end

    it "should show user" do
      controller.should_receive(:authenticate_user!).and_return(true)
      get :show, id: user.id
      response.should render_template(:show)
      response.should be_success
    end

    it "should have no route without id" do
      expect {
        get :show
      }.to raise_error(ActionController::RoutingError)
    end
  end
end
