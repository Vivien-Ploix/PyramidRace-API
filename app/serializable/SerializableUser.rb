class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email, :firstname, :lastname, :pseudo, :score

  link :self do
    @url_helpers.user_url(@object.id)
  end
end