class AthletsController < ApplicationController
  respond_to :json

  def index
    @athlets = Athlet.all
  end

  def show
    @athlet = Athlet.find(params[:id])
    if @athlet.nil?
      @athlets = Athlet.all
      render :index, :alert => 'Athlet nicht gefunden!'
    end

    respond_to do |format|
      format.html
      format.json { render :json => @athlet }
    end
  end

  def new
    @athlet = Athlet.new

    respond_to do |format|
      format.html
      format.json { render :json => @athlet }
    end
  end

  def create
    @athlet = Athlet.new(params[:athlet])

    respond_to do |format|
      if @athlet.save
        format.html  { redirect_to(@athlet,
                    :notice => 'Athlet erfolgreich erstellt.') }
        format.json  { render :json => @athlet,
                    :status => :created, :location => @athlet }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @athlet.errors,
                    :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @athlet = Athlet.find(params[:id])
  end

  def update
    @athlet = Athlet.find(params[:id])
 
    respond_to do |format|
      if @athlet.update_attributes(params[:athlet])
        format.html  { redirect_to(@athlet,
                      :notice => 'Athlet erfolgreich geaendert.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @athlet.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @athlet = Athlet.find(params[:id])
    @athlet.destroy
 
    respond_to do |format|
      format.html { redirect_to athlets_url }
      format.json { head :no_content }
    end
  end

end
