class Page < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :page_category
  has_many :sections
end
