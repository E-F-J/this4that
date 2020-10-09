class Request < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_many :messages
end
