# frozen_string_literal: true

module Types
  class PolicyInputType < Types::BaseInputObject
    argument :start_date, GraphQL::Types::ISO8601DateTime, required: true
    argument :end_date, GraphQL::Types::ISO8601DateTime, required: true
    argument :insured_id, ID, required: true
  end
end
