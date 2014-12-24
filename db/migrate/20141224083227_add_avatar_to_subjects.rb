class AddAvatarToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :image, :string
  end
end
