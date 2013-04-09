require 'spec_helper'

describe ApplicationController do
  controller do
    def index
      params.require(:a)
    end
  end

  render_views

  it { Rails.application.config.consider_all_requests_local.should be_false }

  it "should render 500 on Exception" do
    controller.stub(:index).and_raise(Exception)
    get :index
    response.should redirect_to('/500')
  end

  it "should render 404 on unknown controller" do
    controller.stub(:index).and_raise(ActionController::UnknownController)
    get :index
    response.should redirect_to('/404')
  end

  it "should render 404 on action not found" do
    controller.stub(:index).and_raise(AbstractController::ActionNotFound)
    get :index
    response.should redirect_to('/404')
  end

  it "should render 400 on parameter missing" do
    get :index
    response.should redirect_to('/400')
  end
end
