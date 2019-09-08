# frozen_string_literal: true

class Province < ActiveRecord::Base

  has_many :cities

end

# == Schema Information
#
# Table name: provinces
#
#  area_id    :integer          not null
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_provinces_on_area_id  (area_id)
#  index_provinces_on_name     (name)
#
