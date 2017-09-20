class HasDiscount < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :discount, optional: true
end
