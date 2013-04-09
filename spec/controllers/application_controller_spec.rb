require 'spec_helper'

describe ApplicationController do

  context "requests are not local" do
    render_views

    it { Rails.application.config.consider_all_requests_local.should be_false }

    it "should render 505 on Exception"

    it "should render 404 on unknow controller"
    it "should render 404 on action not found"
    it "should render 400 on parameter missing"
  end
end
