class User::Credential < ApplicationRecord
  has_one :user_profile, class_name: "User::Profile", foreign_key: "user_credentials_id"
  has_many :strava_activities, class_name: "Strava::Activity", foreign_key: "user_credentials_id"
end
