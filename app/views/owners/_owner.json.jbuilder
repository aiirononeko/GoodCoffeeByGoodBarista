json.extract! owner, :id, :company, :name, :email, :password_digest, :title, :about, :introduce, :wanted, :created_at, :updated_at
json.url owner_url(owner, format: :json)
