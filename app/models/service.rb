class Service < ActiveRecord::Base
  attr_accessible :authorized, :call_customer_if_repair_exceeds_amount, :color, :completion_signature, :customer_id, :customer, :customer_comments, :due_date, :est_by, :est_dollar, :item_description, :labor_total, :make, :mechanics_comments_and_recommendations, :model, :number_of_items, :parts_total, :ready_and_notified_date, :safety_warning_accepted, :safety_warning_date, :safety_warning_listed, :safety_warning_signature, :save_old_parts, :status, :tax, :total, :work_performed_by, :line_items_attributes, :customer_attributes
  
  belongs_to :customer
  accepts_nested_attributes_for :customer, :update_only => true
  validates :customer, :presence => true

  has_many :line_items, :inverse_of => :service, :dependent => :destroy
  accepts_nested_attributes_for :line_items, :allow_destroy => true, :reject_if => lambda {|l| (l[:name].blank? || PRESET_LINE_ITEM_NAMES.include?(l[:name])) && l[:options].blank? && l[:parts_cost].blank? && l[:labor_cost].blank? }

#  def assign_attributes(value, opts)
#    customer_atts = value.delete(:customer_attributes)
#    super(value, opts)
#    self.customer.reload
#    self.customer_attributes = customer_atts
#  end

  def customer_attributes=(attrs)    
    self.customer = Customer.find_or_initialize_by_id(attrs.delete(:id))
    self.customer.attributes = attrs
  end

  STATUS_LIST = ["Pending", "In Progress", "Hold", "Ready", "Notified", "Received", "Paid-Not Received", "Waiting on Parts", "Other"]
  
  PRESET_LINE_ITEM_NAMES =
    ["Install Tube", "Install Tire", "Adjust Brakes", "Adjust Gears", "Replace Cables", "Replace Brake Pads", "Adjust Bearings", "True Wheel", "Respoke Wheel", "Overhaul", "Bike Tune-Up", "Bike Overhaul", "Install", "Shop Supply Fee"]
  
  def line_items_with_presets
    PRESET_LINE_ITEM_NAMES.each{|name| preset_line_item_for(name)}
    line_items_without_presets #.where("line_items.name NOT IN (?)", PRESET_LINE_ITEM_NAMES)
  end
  alias_method_chain :line_items, :presets

  def preset_line_item_for(name)
    return nil if !PRESET_LINE_ITEM_NAMES.include?(name)

    line_items_without_presets.find_or_initialize_by_name(name)
  end

  def self.preset_line_item_options(name)
    {"Install Tube" => ["F","R"], "Install Tire" => ["F","R"], "Adjust Brakes" => ["F","R"], "Adjust Gears" => ["F","R"], "Replace Cables" => ["FB","RB","FD","RD","ALL"], "Replace Brake Pads" => ["FB","RB","BOTH"], "Adjust Bearings" => ["FH","RH","HD","BB","ALL"], "True Wheel" => ["F","R","BOTH"], "Respoke Wheel" => ["F","R","BOTH"], "Overhaul" => ["FH","RH","HD","BB","ALL"], "Bike Tune-Up" => ["Standard","Major"], "Bike Overhaul" => ["Standard","Major"]}[name] || []
  end

  def line_items_attributes
    line_items.map(&:attributes)
  end
end
