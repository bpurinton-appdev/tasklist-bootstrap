# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  body       :text
#  status     :string           default("not yet started")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Task < ApplicationRecord
  validates :body, presence: true
  validates :status, presence: true
  validates :user, presence: true

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
end
