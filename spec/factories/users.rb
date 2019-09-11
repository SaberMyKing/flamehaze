# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  uid        :string
#  nickname   :string
#  avatar     :string
#  email      :string
#  mobile     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :user do
    
  end
end
