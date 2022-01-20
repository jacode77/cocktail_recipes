require 'rails_helper'
require 'rails_helper'

RSpec.describe "Cocktails", type: :request do

  describe "GET /cocktails" do

    before(:each) do #this is a hook and will be applied to each test. Avoids repetition
      get '/cocktails'
    end

    it "should respond with 200 ok" do
      # get '/cocktails'
      expect(response).to have_http_status(200)
    end

    it "should render json" do
      # get '/cocktails'
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    # it "should render an array with 3 cocktails" do
    #   # get '/cocktails'
    #   cocktails = JSON.parse(response.body)
    #   expect(cocktails.length).to eq(3)
    # end
  end

  describe "GET /cocktails/:id" do
    
    it "should respond with json when given valid id" do
      get '/cocktails/1'
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end 

    it "should return Espresso Martini when going to id 1" do 
      get '/cocktails/1'
      expect(response.body).to include("Espresso Martini")
    end
    
    it "should respond with 404 when given invalid id" do 
      get '/cocktails/99'
      expect(response).to have_http_status(404)
      expect(response.body).to include("The page you were looking for doesn't exist")
    end

  end

  describe "POST /cocktails" do
    it "should respond with 201 created" do
      post '/cocktails', params: {
        name: "Fruit Tingle",
        base: "Vodka",
        instructions: "Add the vodka, blue curacao & lemonade then give it a light stir. Pour a small dash of raspberry cordial on top. Garnish with a pineapple wedge or maraschino cherry"
      }
      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response.body).to include("Fruit Tingle")
    end
  end

end
