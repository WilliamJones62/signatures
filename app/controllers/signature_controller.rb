class SignatureController < ApplicationController
  before_action :build_customer_list, only: [:index]

  def selected
    customers = []
    customers = $customers
    customers.each do |c|
      select_item = []
      select_item = c
      if params[:customer] == select_item[1].to_s
        session[:customer] = select_item[0]
        break
      end
    end
    redirect_to action: "index"
  end

  def index
  end

  def invoice
    @invoice = "http://e21m.dartagnan.com:3000/assets/"+params[:invoice]+"_Page_01.jpg"
    @signature = "http://e21m.dartagnan.com:3000/assets/"+params[:order]+params[:release]+".jpg"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Build a list of customers
    def build_customer_list
      @customer = []
      customer = []
      $customers = []
      tempcustomer = []
      orderfrom = Orderfrom.where("cust_status = ?", 'A')
      orderfrom.each do |o|
        tempcustomer.push(o.cust_code)
      end
      customer = tempcustomer.sort
      if !session[:customer] || session[:customer == '']
        session[:customer] = customer[0]
      end

      i = 1
      @selected_customer = 0
      customer.each do |c|
        select_item = []
        select_item.push(c)
        select_item.push(i)
        @customer.push(select_item)
        if c == session[:customer]
          @selected_customer = i
        end
        i += 1
      end
      $customers = @customer
      @invoices = []
      @invoices = Invhead.where("order_date > ?", 1.year.ago).where("cust_code = ?", session[:customer])
    end

end
