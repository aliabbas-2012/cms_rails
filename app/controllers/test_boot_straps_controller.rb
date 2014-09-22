class TestBootStrapsController < ApplicationController
  before_action :set_test_boot_strap, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  # GET /test_boot_straps
  # GET /test_boot_straps.json
  def index
    @test_boot_straps = TestBootStrap.all
  end

  # GET /test_boot_straps/1
  # GET /test_boot_straps/1.json
  def show
  end

  # GET /test_boot_straps/new
  def new
    @test_boot_strap = TestBootStrap.new
  end

  # GET /test_boot_straps/1/edit
  def edit
  end

  # POST /test_boot_straps
  # POST /test_boot_straps.json
  def create
    @test_boot_strap = TestBootStrap.new(test_boot_strap_params)

    respond_to do |format|
      if @test_boot_strap.save
        format.html { redirect_to @test_boot_strap, notice: 'Test boot strap was successfully created.' }
        format.json { render :show, status: :created, location: @test_boot_strap }
      else
        format.html { render :new }
        format.json { render json: @test_boot_strap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_boot_straps/1
  # PATCH/PUT /test_boot_straps/1.json
  def update
    respond_to do |format|
      if @test_boot_strap.update(test_boot_strap_params)
        format.html { redirect_to @test_boot_strap, notice: 'Test boot strap was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_boot_strap }
      else
        format.html { render :edit }
        format.json { render json: @test_boot_strap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_boot_straps/1
  # DELETE /test_boot_straps/1.json
  def destroy
    @test_boot_strap.destroy
    respond_to do |format|
      format.html { redirect_to test_boot_straps_url, notice: 'Test boot strap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_boot_strap
      @test_boot_strap = TestBootStrap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_boot_strap_params
      params.require(:test_boot_strap).permit(:title, :description)
    end
end
