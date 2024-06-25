# frozen_string_literal: true

module Types
  class InsuredType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :cpf, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime
    field :updated_at, GraphQL::Types::ISO8601DateTime
  end
end
