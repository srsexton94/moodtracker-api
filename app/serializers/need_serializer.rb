class NeedSerializer < ActiveModel::Serializer
  attributes :id, :hunger, :comfort, :bladder, :energy, :fun, :social, :hygiene, :environment
end
