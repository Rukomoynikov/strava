require 'rails_helper'

RSpec.describe User::Credential, type: :model do
  it "should have connection with User::Profile instance" do
    user_credential = User::Credential.create(
      athlete_id: 1,
      expires_at: 1,
      expires_in: 1,
      refresh_token: "1",
      access_token: "1",
    )

    User::Profile.create(
      username: "username",
      firstname: "firstname", 
      lastname: "lastname",
      sex: "M",
      picture: "Picture",
      user_credentials: user_credential
    )
  end
end
