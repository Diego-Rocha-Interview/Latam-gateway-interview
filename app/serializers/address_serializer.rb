class AddressSerializer < ActiveModel::Serializer
  attributes :id,:cep,:state,:city,:district,:street,:email
end
