class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def view_all
  #  @transactions = Transaction.group(:transaction_date).count.sort.reverse
    @transactions = Transaction.group(:transaction_date).where('amount <? ', 0).sum(:amount)

  end

  def get_details
    @transactions = Transaction.where(:transaction_date => params[:id])
  end

  def to_print_pdf
    @transactions = Transaction.where('amount <=? AND transaction_date =?', -1000, params[:id].to_date)
#    @transactions = Transaction.where(:transaction_date => params[:id])
    html = render_to_string :layout => false
    kit = PDFKit.new(html, page_size: 'A4', orientation: 'Landscape')
    kit.stylesheets << Rails.root.join('public', 'stylesheets', 'styles.css') #'/public/stylesheets/styles.css'
    send_data(kit.to_pdf, :filename => 'Account_Statement_'+ params[:id] +'.pdf', :type => 'application/pdf')
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    params[:transaction]
  end
end
