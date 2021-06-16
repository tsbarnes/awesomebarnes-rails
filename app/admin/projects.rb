ActiveAdmin.register Project do
  permit_params :title, :subtitle, :description, :order, :image

  show do
    panel "Project" do
      attributes_table_for project do
        row :image do |i|
          if i.image.present?
            image_tag url_for(i.image.variant(resize_to_limit: [100,100]))
          else
            content_tag(:span, "No image yet")
          end
        end
        row :title
        row :subtitle do |s|
          raw(s.subtitle)
        end
        row :description do |d|
          raw(d.description)
        end
        row :order
      end
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs "parameters" do
      f.input :title
      f.input :subtitle, as: :medium_editor
      f.input :description, as: :medium_editor
      f.input :order
      f.input :image, as: :file, :hint => f.object.image.present? \
        ? image_tag(f.object.image.variant(resize_to_limit: [100,100]))
                                            : content_tag(:span, "no image yet")
    end
    f.actions
  end
end
