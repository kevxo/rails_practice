class Parent < ApplicationRecord
  has_many :children

  validates :name, :age, presence: true

end
