ActiveAdmin.register Post do

  permit_params :name, :body,:permalink
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :permalink

    end
    f.inputs "Content" do
      f.input :body
    end
    f.actions
  end


end