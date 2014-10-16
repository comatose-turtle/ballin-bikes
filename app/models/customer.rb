class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :email, :home_phone, :mailing_list, :name, :state, :work_phone, :zip, :preferred_contact_method

  has_many :services, :dependent => :destroy

  validates :name, :presence => true
  validates :email, :presence => {:unless => Proc.new{|c| c.home_phone.present? || c.work_phone.present? }, :message => "or phone must be given"}
end
