require 'rails_helper'

describe "PATCH api/v1/links/:id" do
  it "updates the specified link", :vcr do
    link = create(:link)
    headers = {'CONTENT-TYPE' => 'application/json'}
    patch "/api/v1/links/#{link.id}", headers: headers, params: { read: true }.to_json
    expect(response).to be_success
    link = JSON.parse(response.body)
    expect(link["read"]).to eq(true)
  end
end
