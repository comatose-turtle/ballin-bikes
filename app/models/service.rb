class Service < ActiveRecord::Base
  belongs_to :customer
  attr_accessible :authorized, :call_customer_if_repair_exceeds_amount, :color, :completion_signature, :customer_comments, :due_date, :est_by, :est_dollar, :estimate, :item_description, :labor_total, :make, :mechanics_comments_and_recommendations, :model, :number_of_items, :parts_total, :ready_and_notified_date, :safety_warning_accepted, :safety_warning_date, :safety_warning_listed, :safety_warning_signature, :save_old_parts, :status, :tax, :total, :work_performed_by
end
