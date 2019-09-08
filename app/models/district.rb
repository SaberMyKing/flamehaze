# frozen_string_literal: true

class District < ActiveRecord::Base

  belongs_to :city

end

# == Schema Information
#
# Table name: districts
#
#  area_id    :integer          not null
#  city_id    :integer
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_districts_on_area_id  (area_id)
#  index_districts_on_city_id  (city_id)
#  index_districts_on_name     (name)
#
