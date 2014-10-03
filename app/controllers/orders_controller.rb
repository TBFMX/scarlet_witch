class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @comandas = Comanda.where("order_id = ?", @order.id)
    @articulos = Array.new
    @comandas.each do |com|
      @aux = Articulo.find(com.articulo_id)
      @articulos.push(@aux)
    end

  end

  # GET /orders/new
  def new
    @order = Order.new
    @cliente_id = 1
    ##optenemos los articulos
    @lasagna = Articulo.where("tipo = 1")
    @ensalada = Articulo.where("tipo = 2")
    @aderezo = Articulo.where("tipo = 3")
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @lasagna = Articulo.where("tipo = 1")
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { 
          ##insertamos las comandas
          @lasagna.each do |las|
            unless params[las.title.to_s].blank?
              if params[las.title.to_s].to_i >= 0
                Comanda.create(articulo_id: las.id.to_i, order_id: @order.id)
              end 
            end   
          end     
          redirect_to @order, notice: 'Su orden a sido procesada'
        }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def pago_nuevo(tarjeta, cliente,items, description)
    ##inician pagos paypal  
    require 'paypal-sdk-rest'
    include PayPal::SDK::REST

    
    # PayPal::SDK::REST.set_config(
    #   :mode => "sandbox", # "sandbox" or "live"
    #   :client_id => "EBWKjlELKMYqRNQ6sYvFo64FtaRLRR5BdHEESmha49TM",
    #   :client_secret => "EO422dn3gQLgDbuwqTjzrFgFtaRLRR5BdHEESmha49TM")
      
    ############################
    #datos nesesarios
    #cliente
      # payment_method (tarjeta de credito)
      # if tarjeta_credito
      #   type <-tarjeta
      #   number (deben ser 16 sin espacio) <-tarjeta
      #   expire_month (int)(usar select)(pasar a string) <-tarjeta
      #   expire_year (int)(usar select)(pasar a string) <-tarjeta
      #   cvv2 (int)(3) <- tarjeta
      #   first_name(string) <- tajeta
      #   last_name(string) <- tajeta
      # end 
    #   direccion
    #     calle y numero (string) <- cliente
    #     city (string) (posible select) <- cliente
    #     estado (string) (posible select) <- cliente
    #     postal_code (5)(string) <- cliente
    #     country_code (MX)

    #   lista de items
    #     item
    #       nombre(title)
    #       sku (title)
    #       price(precio)
    #       currency ("MXN")
    #       quantity (cantidad)
    #     amount
    #       total(total)
    #       currency ("MXN")
    #     description (descripcion de la orden)
    ############################
    # Build Payment object
    @payment = Payment.new({
      :intent => "sale",
      :payer => {
        :payment_method => "credit_card",
        :funding_instruments => [{
          :credit_card => {
            :type => "visa",
            :number => "4417119669820331",
            :expire_month => "11",
            :expire_year => "2018",
            :cvv2 => "874",
            :first_name => "Joe",
            :last_name => "Shopper",
            :billing_address => {
              :line1 => "52 N Main ST",
              :city => "Johnstown",
              :state => "OH",
              :postal_code => "43210",
              :country_code => "MX" }}}]},
      :transactions => [{
        :item_list => {
          :items => [{
            :name => "item",
            :sku => "item",
            :price => "1",
            :currency => "USD",
            :quantity => 1 }]},
        :amount => {
          :total => "1.00",
          :currency => "USD" },
        :description => "This is the payment transaction description." }]})

    # Create Payment and return the status(true or false)
    if @payment.create
      @payment.id     # Payment Id
    else
      @payment.error  # Error Hash
    end
    ##terminan paypal
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:client_id, :fecha_pedido, :tipo_pago, :tipo_entrega, :fecha_entrega, :status)
    end
end
