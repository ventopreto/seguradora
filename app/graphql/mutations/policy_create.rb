# frozen_string_literal: true

module Mutations
  class PolicyCreate < BaseMutation
    description "Creates a new policy"

    field :policy, Types::PolicyType, null: false

    argument :policy_input, Types::PolicyInputType, required: true

    def resolve(policy_input:)
      policy = ::Policy.new(**policy_input)
      raise GraphQL::ExecutionError.new "Error creating policy", extensions: policy.errors.to_hash unless policy.save

      {policy: policy}
    end
  end
end
