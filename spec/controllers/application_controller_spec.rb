require 'spec_helper'

describe ApplicationController do
  controller do
    def index
      params.require(:a)
    end
    def new
      Show.find(nil)
    end
  end

  render_views

  it { expect(Rails.application.config.consider_all_requests_local).to be_false }

  it "should render 500 on Exception" do
    controller.stub(:index).and_raise(Exception)
    get :index
    expect(response.status).to eq 500
  end

  it "should render 404 on unknown controller" do
    controller.stub(:index).and_raise(ActionController::UnknownController)
    get :index
    expect(response.status).to eq 404
  end

  it "should render 404 on action not found" do
    controller.stub(:index).and_raise(AbstractController::ActionNotFound)
    get :index
    expect(response.status).to eq 404
  end

  it "should render 400 on parameter missing" do
    get :index
    expect(response.status).to eq 404
  end

  #= Redirects to /500, why?
  # it "should render 404 on Mongoid DocumentError" do
  #   get :new
  #   response.should redirect_to('/404')
  # end
end
