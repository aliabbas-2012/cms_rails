class Page < ActiveRecord::Base
  belongs_to :subject
  validates :name, uniqueness: true

  HUMANIZED_ATTRIBUTES = {
      :name => 'Name',:subject_id => 'Subject',:position => 'Order',:is_visible=>'Visibility',
  }

  def self.human_attribute_name(attr,options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
    
  end
end
