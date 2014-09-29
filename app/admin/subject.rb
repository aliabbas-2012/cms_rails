ActiveAdmin.register Subject do

  permit_params :name, :description, :is_visible, pages_attributes: [:id, :name, :permalink, :body, :is_visible, :_destroy]
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :is_visible

    end
    f.inputs "Content" do
      f.input :description
    end

    f.has_many :pages do |k|
      if k.object.nil?
        k.inputs "Details" do
          k.input :name
          k.input :permalink
          k.input :is_visible
        end
        k.inputs "Content" do
          k.input :body
        end
      else
        k.inputs "Details" do
          k.input :name
          k.input :permalink
          k.input :is_visible
        end
        k.inputs "Content" do
          k.input :body
        end
        k.input :_destroy, :as => :boolean, :label => "delete"
      end
    end

    f.actions
  end

  show do |f|
    panel "Subject" do
      attributes_table_for f, :name, :description, :is_visible
    end

    panel "Pages in List View" do
      table_for(f.pages) do |page|
        column :name
        column :permalink
        column :is_visible

      end
    end

    panel "Pages in View " do
      div_for(f.pages) do |page|
        panel page.name do
          attributes_table_for page, :name, :description, :is_visible
        end
      end
    end

  end

end