# frozen_string_literal: true

class Province < ActiveRecord::Base

  has_many :cities

end

# == Schema Information
#
# Table name: provinces
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  area_id    :integer          not null
#
# Indexes
#
#  index_provinces_on_area_id  (area_id)
#  index_provinces_on_name     (name)
#
