class Child < ApplicationRecord
  belongs_to :parent

  validates :name, :age, presence: true

end
