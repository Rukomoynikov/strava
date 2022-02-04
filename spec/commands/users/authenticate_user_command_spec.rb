require 'rails_helper'

describe Users::AuthenticateUserCommand do
  let (:encoded_data) {"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.dVVQ8VMclNtgGdImHV79Jzs5YFGFJmOVzWub0addv9s"}

  it "gives encoded athlete_id" do
    expect(described_class.call(1).result).to eq(encoded_data)
  end
end
