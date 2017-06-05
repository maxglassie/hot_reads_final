require 'rails_helper'

describe "links API" do
    it "post request creates a new link" do
        params = {
            origin_id: 1,
            url: "https://www.google.com",
            read: true
        }

        post '/api/v1/links', params

        expect(response).to be_success
        expect(response.status).to be(201)

        link = JSON.parse(response.body)

        expect(link["url"]).to eq(params[:url])
        expect(link["read"]).to eq(params[:read])
        expect(link["origin_id"]).to eq(params[:origin_id])
    end
end