require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  setup do
    @service = services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service" do
    assert_difference('Service.count') do
      post :create, service: { authorized: @service.authorized, call_customer_if_repair_exceeds_amount: @service.call_customer_if_repair_exceeds_amount, color: @service.color, completion_signature: @service.completion_signature, customer_comments: @service.customer_comments, due_date: @service.due_date, est_by: @service.est_by, est_dollar: @service.est_dollar, estimate: @service.estimate, item_description: @service.item_description, labor_total: @service.labor_total, make: @service.make, mechanics_comments_and_recommendations: @service.mechanics_comments_and_recommendations, model: @service.model, number_of_items: @service.number_of_items, parts_total: @service.parts_total, ready_and_notified_date: @service.ready_and_notified_date, safety_warning_accepted: @service.safety_warning_accepted, safety_warning_date: @service.safety_warning_date, safety_warning_listed: @service.safety_warning_listed, safety_warning_signature: @service.safety_warning_signature, save_old_parts: @service.save_old_parts, status: @service.status, tax: @service.tax, total: @service.total, work_performed_by: @service.work_performed_by }
    end

    assert_redirected_to service_path(assigns(:service))
  end

  test "should show service" do
    get :show, id: @service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service
    assert_response :success
  end

  test "should update service" do
    put :update, id: @service, service: { authorized: @service.authorized, call_customer_if_repair_exceeds_amount: @service.call_customer_if_repair_exceeds_amount, color: @service.color, completion_signature: @service.completion_signature, customer_comments: @service.customer_comments, due_date: @service.due_date, est_by: @service.est_by, est_dollar: @service.est_dollar, estimate: @service.estimate, item_description: @service.item_description, labor_total: @service.labor_total, make: @service.make, mechanics_comments_and_recommendations: @service.mechanics_comments_and_recommendations, model: @service.model, number_of_items: @service.number_of_items, parts_total: @service.parts_total, ready_and_notified_date: @service.ready_and_notified_date, safety_warning_accepted: @service.safety_warning_accepted, safety_warning_date: @service.safety_warning_date, safety_warning_listed: @service.safety_warning_listed, safety_warning_signature: @service.safety_warning_signature, save_old_parts: @service.save_old_parts, status: @service.status, tax: @service.tax, total: @service.total, work_performed_by: @service.work_performed_by }
    assert_redirected_to service_path(assigns(:service))
  end

  test "should destroy service" do
    assert_difference('Service.count', -1) do
      delete :destroy, id: @service
    end

    assert_redirected_to services_path
  end
end
