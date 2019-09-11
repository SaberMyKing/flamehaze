# frozen_string_literal: true

class District < ActiveRecord::Base

  belongs_to :city

end

# == Schema Information
#
# Table name: districts
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  area_id    :integer          not null
#  city_id    :bigint(8)
#
# Indexes
#
#  index_districts_on_area_id  (area_id)
#  index_districts_on_city_id  (city_id)
#  index_districts_on_name     (name)
#
