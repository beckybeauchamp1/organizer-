class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :shirt
  belongs_to :pant
  belongs_to :tee
  belongs_to :short
  belongs_to :dress
  belongs_to :tank
end
