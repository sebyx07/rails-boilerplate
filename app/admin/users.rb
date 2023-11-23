# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  searchable_select_options(scope: -> { User.all },
                            filter: ->(term, scope) {
                              scope.search(term).result
                            }, text_attribute: :email,
                            display_text: ->(record) do
                              record.email
                            end)

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
