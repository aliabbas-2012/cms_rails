class Subject < ActiveRecord::Base
  has_many :pages
  attr_reader :visibility
  accepts_nested_attributes_for :pages, :reject_if => :all_blank, :allow_destroy => true

  validates :name, uniqueness: true
  validates :name, presence: true
  scope :visible ,lambda {where(:visble=>true)}
  scope :invisible ,lambda {where(:visble=>false)}
  scope :new_first ,lambda {order('created_at DESC')}
  scope :sorted ,lambda {order('is_positon ASC')}
  scope :last_record ,lambda {order('created_at DESC').limit(1)}
  scope :search ,lambda { |query|
    where(['name LIKE ? ',"%#{query}% "])
  }
  scope :search_more_fields ,lambda { |query|
    where("name LIKE :name OR description LIKE :desc",
          {:name => "%#{query}%", :desc => "%#{query}%",})
  }
  scope :search_form_parameters ,lambda { |query,query2,query3|
    where("name LIKE :p1 OR name LIKE :p2 OR name LIKE :p3",
          {:p1 => "%#{query}%", :p2 => "%#{query2}%",:p3 => "%#{query3}%",})
  }

  def find_first_page(id)
    Page.find_by_subject_id(id)
  end

  def visibility
    if self.is_visible
      return 'Visible'
    else
      return 'In-Visible'
    end
  end
end
