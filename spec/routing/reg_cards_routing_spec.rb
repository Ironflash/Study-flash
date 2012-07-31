require "spec_helper"

describe RegCardsController do
  describe "routing" do

    it "routes to #index" do
      get("/reg_cards").should route_to("reg_cards#index")
    end

    it "routes to #new" do
      get("/reg_cards/new").should route_to("reg_cards#new")
    end

    it "routes to #show" do
      get("/reg_cards/1").should route_to("reg_cards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/reg_cards/1/edit").should route_to("reg_cards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/reg_cards").should route_to("reg_cards#create")
    end

    it "routes to #update" do
      put("/reg_cards/1").should route_to("reg_cards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/reg_cards/1").should route_to("reg_cards#destroy", :id => "1")
    end

  end
end
