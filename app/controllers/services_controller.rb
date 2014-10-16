class ServicesController < ApplicationController
  # GET /services
  # GET /services.json
  def index
    @services = Service
    @services = @services.joins(:customer) if params[:sort_by] =~ /^customers.name/
    @services = @services.order(params[:sort_by]) if params[:sort_by].present?
    @services = @services.where("services.id LIKE ? OR customers.name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    
    @services = @services.all
    @republish_params = {:sort_by => params[:sort_by], :search => params[:search]}
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service = Service.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/new
  # GET /services/new.json
  def new
    @customer = Customer.find(params[:customer_id]) if params[:customer_id]
    @service = @customer ? @customer.services.new : Service.new
    @service.build_customer unless @customer

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
  end

  # POST /services
  # POST /services.json
  def create
    @customer = Customer.find(params[:customer_id]) if params[:customer_id]
    @service = @customer ? @customer.services.build(params[:service]) : Service.new(params[:service])

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    @service = Service.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end
end
