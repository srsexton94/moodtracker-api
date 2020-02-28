# frozen_string_literal: true

class NeedSerializer < ActiveModel::Serializer
  attributes :id,
             :hunger,
             :comfort,
             :bladder,
             :energy,
             :fun,
             :social,
             :hygiene,
             :environment,
             :mood,
             :user
end
