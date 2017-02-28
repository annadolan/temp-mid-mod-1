class Api::V1::ReadLinksController < ApiController
  def create
    ReadLink.destroy_all
    params["_json"].each do |object|
      ReadLink.create(url: object["url"].strip)
    end
  end
end
