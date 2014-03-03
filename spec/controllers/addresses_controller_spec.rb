require 'spec_helper'

describe AddressesController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: FactoryGirl.create(:address)
      expect(response).to be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      expect(response).to be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', id: FactoryGirl.create(:address)
      expect(response).to be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update', id: FactoryGirl.create(:address)
      expect(response).to be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy', id: FactoryGirl.create(:address)
      expect(response).to be_success
    end
  end

end
