class Task < ApplicationRecord
  belongs_to :list
  attribute :complete, :boolean, default: false
end
