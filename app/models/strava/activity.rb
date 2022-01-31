class Strava::Activity < ApplicationRecord
  belongs_to :user_credentials, class_name: "User::Credential"
end
