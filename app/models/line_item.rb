class LineItem < ActiveRecord::Base
  attr_accessible :labor_cost, :name, :options, :parts_cost
  belongs_to :service

  def options
    val = read_attribute(:options)
    val.present? ? JSON.parse(val) : []
  end

  def options=(value)
    write_attribute(:options, value.to_json)
  end
end
