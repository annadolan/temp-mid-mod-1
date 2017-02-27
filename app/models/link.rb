class Link < ApplicationRecord
  belongs_to :user

  validates :url, :url => true
  validates :title,
            :url, presence: true
  validates :url, uniqueness: true
  # scope :hot, -> {
  #   select('links.url as url')
  #     .joins('join reads on reads.link_id = links.id')
  #     .where('reads.created_at > ?', Time.now - 1.day)
  #     .group("links.url")
  #     .order('count("reads".id) DESC').limit(10)
  # }
end
