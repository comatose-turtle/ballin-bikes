class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :email, :home_phone, :mailing_list, :name, :state, :work_phone, :zip

  has_many :services
end
