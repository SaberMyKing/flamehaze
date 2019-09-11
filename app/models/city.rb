# frozen_string_literal: true

class City < ActiveRecord::Base

  DEFAULT_CITY = '深圳市'

  belongs_to :province
  has_many :districts

  def self.current=(city)
    RequestStore.store[:city] = city
  end

  def self.current
    RequestStore.store[:city] || DEFAULT_CITY
  end

end

# == Schema Information
#
# Table name: cities
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  area_id     :integer          not null
#  province_id :bigint(8)
#
# Indexes
#
#  index_cities_on_area_id      (area_id)
#  index_cities_on_name         (name)
#  index_cities_on_province_id  (province_id)
#
