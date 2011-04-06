class WaitingList < ActiveRecord::Base
	belongs_to :product
	belongs_to :variant
	
	validates :email, :presence => true, 
                    :format => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
end
