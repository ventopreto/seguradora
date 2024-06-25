require "rails_helper"

RSpec.describe "Policy", type: :request do
  let(:policy) do
    Insured.create!(name: "Mad Max", cpf: 96151218000)
    Policy.create!(start_date: "05/12/1974", end_date: "05/12/2030", insured_id: Insured.find_by(cpf: 96151218000).id)
  end

  let(:query_string) do
    <<-GRAPHQL
          query($id: ID!){
            policy(id:$id){
              __typename
              id
              insuredId
            }
          }
    GRAPHQL
  end

  context "Query policy(id)" do
    context "when valid" do
      it "load policy by ID" do
        result = MyappSchema.execute(query_string, variables: {id: policy.id})
        policy_result = result["data"]["policy"]

        expect(policy_result["id"]).to eq(policy.id.to_s)
        expect(policy_result["__typename"]).to eq("Policy")
        expect(policy_result["insuredId"]).to eq(policy.insured_id.to_s)
      end
    end

    context "when invalid" do
      it "raise an error" do
        expect {
          MyappSchema.execute(query_string, variables: {id: 3})
        }.to raise_error(ActiveRecord::RecordNotFound, "Couldn't find Policy with 'id'=3")
      end
    end
  end
end
