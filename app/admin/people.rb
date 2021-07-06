ActiveAdmin.register Person do
  permit_params :name, :title, :summary, :order, :image

  show do
    panel "Person" do
      attributes_table_for person do
        row :image do |i|
          if i.image.present?
            image_tag url_for(i.image.variant(resize_to_limit: [100,100]))
          else
            content_tag(:span, "No image yet")
          end
        end
        row :name
        row :title do |s|
          raw(s.title)
        end
        row :summary do |d|
          raw(d.summary)
        end
        row :order
      end
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs "parameters" do
      f.input :name
      f.input :title, as: :medium_editor
      f.input :summary, as: :medium_editor
      f.input :order
      f.input :image, as: :file, :hint => f.object.image.present? \
        ? image_tag(f.object.image.variant(resize_to_limit: [100,100]))
                                            : content_tag(:span, "no image yet")
    end
    f.actions
  end
end
