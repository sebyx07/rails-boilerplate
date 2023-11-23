# frozen_string_literal: true

ActiveAdmin.register Post do
  permit_params :title, :content, :user_id

  index do
    selectable_column
    id_column
    column :title
    column :user
    column :created_at
    actions
  end

  filter :title
  filter :content
  filter :user, as: :searchable_select, ajax: true
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      f.input :user, as: :searchable_select, ajax: true
    end
    f.actions
  end
end
