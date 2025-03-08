# class Earthquake < ApplicationRecord
#     belongs_to :user

#     scope :by_user, lambda {|use|
#         where(:user_id => user.id)
#     }
# end


# class Earthquake < ApplicationRecord
#     belongs_to :user
  
#     # Define the scope with the correct parameter name
#     scope :by_user, ->(user) { where(user_id: user.id) }

#     #validations
# end


class Earthquake < ApplicationRecord
    belongs_to :user
  
    # Define the scope with the correct parameter name
    scope :by_user, ->(user) { where(user_id: user.id) }
  
    # Validations
    validates :date, presence: true
    validates :time, presence: true
    validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
    validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
    validates :location, presence: true, length: { maximum: 255 }
    validates :depth, presence: true, numericality: { greater_than_or_equal_to: 0 }

    after_save :expire_cache
    after_destroy :expire_cache

    def expire_cache
        Rails.cache.delete("earthquakes/by_user/#{user.id}")
    end
end
  