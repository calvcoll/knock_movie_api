class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates_inclusion_of :rating, :in => 1..10
end
