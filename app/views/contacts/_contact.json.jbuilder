json.extract! contact, :id, :first_name, :middle_name, :last_name, :phone, :email, :address, :created_at, :updated_at
json.url contact_url(contact, format: :json)
