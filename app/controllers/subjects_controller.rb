class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :confirmed_login

  layout 'admin'
  # GET /subjects
  # GET /subjects.json
  def index

    if params[:page].nil?
      params[:page] = 1
    end
    sort = 'id ASC'
    sort = case params['sort']
             when "name"  then "name"
             when "name_reverse"  then "name DESC"

             when "id"  then "id"
             when "id_reverse"  then "id DESC"

             when "is_visible"  then "is_visible"
             when "is_visible_reverse"  then "is_visible DESC"
           end
    @subjects = Subject.paginate(:per_page => 10, :page => params[:page]).order(sort)
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
    #puts params
    #puts "-----------------"
    #@subject.image = params['image']
    @subject.pages.build
  end

  # GET /subjects/1/edit
  def edit
    @subject.pages.build
    #@subject.image = params['image']
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save

        format.html { redirect_to @subject, :flash => { :success =>'Subject was successfully created.' }}
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update

    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, :flash => { :success =>'Subject was successfully updated.' }}
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, :flash => { :success => 'Subject was successfully destroyed.' }}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params

      params[:subject].permit(:name, :description,:image,:is_visible,permit_hstore_params(:custom_fields, params[:subject][:custom_fields]),pages_attributes: [:id,:name,:permalink, :body, :is_visible, :_destroy])
    end

  def permit_hstore_params(key, hstore_params)
    keys = hstore_params.try(:keys)

    # Return key if params are empty,
    # this allows the hstore key to be removed.
    return key if keys.blank?

    # Otherwise, return the keys to be whitelisted
    { key => keys }
  end
end
