class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :envio]
  skip_before_action :authorize, only: [:show, :new,:edit, :update, :destroy, :programar, :agregar_programa, :envio]

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
    #@lasagna = Articulo.where("tipo = 1")
    @articulo = Articulo.all
    params[:fecha_pedido] = Time.now
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { 
          ##insertamos las comandas
          @articulo.each do |las|
            unless params[las.title.to_s].blank?
              if params[las.title.to_s].to_i >= 0
                Comanda.create(articulo_id: las.id.to_i, order_id: @order.id)
              end 
            end   
          end     
          redirect_to enviar_path(:id => @order), notice: 'Su orden a sido procesada'
        }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def envio
    unless session[:user_id].blank? 
      @user_id = session[:user_id]
    else
      redirect_to login_path
    end  
  end

  def envio_c
    calle = params[:calle]
    colonia = params[:colonia]
    ciudad = params[:ciudad]
    estado = params[:estado] 
    respond_to do |format|
      if @order.update(:calle => calle, :colonia => colonia, :ciudad => ciudad, :estado => estado ,:status => 1 )
        format.html { render :pagar , notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :envio }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def programar
    @order = Order.new
    @cliente_id = 1
    ##optenemos los articulos
    @lasagna = Articulo.where("tipo = 1")
    @ensalada = Articulo.where("tipo = 2")
    @aderezo = Articulo.where("tipo = 3")
  end

  def agregar_programa
    @articulo = Articulo.all
    #params[:fecha_pedido] = 
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { 
          ##insertamos las comandas
          @articulo.each do |las|
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
  def pagar
    @cliente
    #pago_nuevo(5579099003548246,)
  end 
  def pago_nuevo()
    #tarjeta, cliente,items, description
    ##inician pagos paypal  
    require 'paypal-sdk-rest'
    #include PayPal::SDK::REST
    # PayPal::SDK::REST.set_config(
    #   :mode => "sandbox", # "sandbox" or "live"
    #   :client_id => "EBWKjlELKMYqRNQ6sYvFo64FtaRLRR5BdHEESmha49TM",
    #   :client_secret => "EO422dn3gQLgDbuwqTjzrFgFtaRLRR5BdHEESmha49TM")
      
    ############################
    #datos nesesarios
    #cliente
       payment_method = "credit_card"
      # if tarjeta_credito
        type = "visa" #<-tarjeta
        number =  "4417119669820331"#(deben ser 16 sin espacio) <-tarjeta
        expire_month = "11" #(int)(usar select)(pasar a string) <-tarjeta
        expire_year = "2018" #(int)(usar select)(pasar a string) <-tarjeta
        cvv2 = "874" #(int)(3) <- tarjeta
        first_name = "Joe"#(string) <- tajeta
        last_name = "Shopper"#(string) <- tajeta
      # end 
    #   direccion
         calle = "52 N Main ST"  #calle y numero (string) <- cliente
         city = "Johnstown" # (string) (posible select) <- cliente
         estado = "OH" # (string) (posible select) <- cliente
         postal_code = "43210" # (5)(string) <- cliente
         country_code = "US" # (MX)

    #   lista de items
    #     item
           nombre = "item" #(title)
           sku = "item" #(title)
           price = 1 #(precio)
           currency = "USD" #("MXN")
           quantity = 1 #(cantidad)
    #     amount
           total = "1.00" #(total)
    #       currency ("MXN")
           description = "mi mensaje" #(descripcion de la orden)
    ############################
    # Build Payment object
    @payment = PayPal::SDK::REST::Payment.new({
    :intent => "sale",
    :payer => {
      :payment_method => "credit_card",
      :funding_instruments => [{
        :credit_card => {
          :type => type.to_s,
          :number => number.to_s,
          :expire_month => expire_month.to_s,
          :expire_year => expire_year.to_s,
          :cvv2 => cvv2.to_s,
          :first_name => first_name.to_s,
          :last_name => last_name.to_s,
          :billing_address => {
            :line1 => calle.to_s,
            :city => city.to_s,
            :state => estado.to_s,
            :postal_code => postal_code.to_s,
            :country_code => country_code.to_s }}}]},
    :transactions => [{
      :item_list => {
        :items => [{
          :name => nombre.to_s,
          :sku => sku.to_s,
          :price => price.to_s,
          :currency => currency.to_s,
          :quantity => quantity.to_i }]},
      :amount => {
        :total => total.to_s,
        :currency => currency.to_s },
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
