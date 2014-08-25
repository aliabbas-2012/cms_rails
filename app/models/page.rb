class Page < ActiveRecord::Base
  belongs_to :subject
  validates :name, uniqueness: true
end
