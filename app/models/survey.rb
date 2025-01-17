class Survey < ApplicationRecord
  validates :name, presence: true
  has_many :components, dependent: :destroy
  accepts_nested_attributes_for :components, allow_destroy: true
end
