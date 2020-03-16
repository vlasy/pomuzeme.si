ActiveAdmin.register Organisation do

  menu if: -> { can? :read, Organisation }

  decorate_with OrganisationDecorator

  scope_to :current_user, association_method: :coordinating_organisations, unless: -> { current_user.has_role?(:super_admin) }

  permit_params :name, :abbreviation, :business_id_number, :contact_person, :contact_person_email, :contact_person_phone

  index do
    column :name
    column :abbreviation
    column :business_id_number
    column :contact_person
    column :contact_person_phone
    column :contact_person_email
    column :created_at
    column :updated_at
    actions if current_user.has_role?(:super_admin) # TODO: move to helper method
  end


end