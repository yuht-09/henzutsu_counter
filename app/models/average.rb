class Average < ApplicationRecord
    belongs_to :user
    validates :user_id, uniqueness: { scope: :pressure_id }
end
