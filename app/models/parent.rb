class Parent < ApplicationRecord
  has_many :children, dependent: :destroy

  validates :name, :age, presence: true

end
