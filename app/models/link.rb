class Link < ApplicationRecord
  belongs_to :user

  validates :url, :url => true
  validates :title,
            :url, presence: true
  validates :url, uniqueness: true

  def is_top_ten?
    if ReadLink.find_by(url: url)
      return true
    else
      return false
    end
  end
end
