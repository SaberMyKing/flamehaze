# frozen_string_literal: true

class User < ApplicationRecord
end

# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  avatar     :string
#  email      :string
#  mobile     :string
#  nickname   :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_uid  (uid)
#
