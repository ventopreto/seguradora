require "rails_helper"

RSpec.describe "Policy", type: :request do
  context "Mutation policy(id)" do
    let(:query_string) do
      <<-GRAPHQL
            mutation($insuredId: ID!, $startDate: ISO8601DateTime!, $endDate: ISO8601DateTime! ) {
              policyCreate(input: {policyInput: {
                insuredId: $insuredId
                startDate: $startDate
                endDate: $endDate
                }
              }
              ) {
                policy {
                  __typename
                  id
                  insuredId
                  startDate
                  endDate
                }
              }
            }
      GRAPHQL
    end

    context "when valid" do
      it "create a policy" do
        Insured.create!(name: "Mad Max", cpf: 96151218000)

        result = MyappSchema.execute(query_string, variables: {
          insuredId: Insured.last.id,
          startDate: "1985-04-12",
          endDate: "1985-09-12"
        })

        policy_result = result["data"]["policyCreate"]["policy"]

        expect(policy_result["__typename"]).to eq("Policy")
        expect(policy_result["id"]).to eq(Policy.last.id.to_s)
        expect(policy_result["insuredId"]).to eq(Insured.last.id.to_s)
        expect(policy_result["startDate"]).to include("1985-04-12")
        expect(policy_result["endDate"]).to include("1985-09-12")
      end
    end

    context "when not valid" do
      it "raise an error" do
        Insured.create!(name: "Mad Max", cpf: 96151218000)

        result = MyappSchema.execute(query_string, variables: {
          insuredId: Insured.last.id,
          startDate: "1985/04/12",
          endDate: "1985-09-12"
        })

        expected_message = "Variable $startDate of type ISO8601DateTime! was provided invalid value"

        expect(result["errors"].first["message"]).to eq(expected_message)
      end
    end
  end
end
