# frozen_string_literal: true

class Bangumi
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
end
