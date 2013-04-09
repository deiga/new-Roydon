require 'spec_helper'

describe ErrorsController do

  describe "GET '404'" do
    it "returns http success" do
      get 'not_found'
      response.should be_success
    end
  end

  describe "GET '500'" do
    it "returns http success" do
      get 'server_error'
      response.should be_success
    end
  end

end
