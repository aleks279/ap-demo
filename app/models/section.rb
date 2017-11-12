class Section < ActiveRecord::Base
  validates :title, :content, presence: true

  belongs_to :page
end
