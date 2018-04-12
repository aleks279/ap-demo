class Page < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :page_category
  has_many :sections, dependent: :destroy

  accepts_nested_attributes_for :sections
end
