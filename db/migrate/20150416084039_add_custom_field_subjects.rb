class AddCustomFieldSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :custom_fields, :hstore
  end
end
