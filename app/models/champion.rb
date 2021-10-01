# frozen_string_literal: true

class Champion < ApplicationRecord
  validates :name, presence: true
  validates :region, presence: true
  validates :rol, presence: true
  validates :comp, presence: true
end
