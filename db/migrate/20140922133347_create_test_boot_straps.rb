class CreateTestBootStraps < ActiveRecord::Migration
  def change
    create_table :test_boot_straps do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
