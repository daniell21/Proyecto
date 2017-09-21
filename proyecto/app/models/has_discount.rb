class HasDiscount < ActiveRecord::Base
  belongs_to :client
  belongs_to :discount
end
