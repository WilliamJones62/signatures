class SignedInvoice < ApplicationRecord
  def self.post_invoice
    start_date = Date.new(2019,9,1)
    year_ago_date = Date.now.1.year.ago
    if year_ago_date > start_date
      invoices = Invhead.where("order_date > ?", year_ago_date))
    else
      invoices = Invhead.where("order_date > ?", start_date))
    end

    invoices.each do |i|
      inv = SignedInvoice.find_by(invoice_numb: i.invoice_numb)
      if inv.blank?
        # there is no signed invoice
        if File.exists?("/home/billj/Desktop/Windows-Share/orders.txt"+i.invoice_numb+".pdf") && File.exists?("/home/billj/Desktop/Windows-Share/orders.txt"+i.order_numb+".pdf")
          # there is an unsigned invoice and signature image available so call qoppa API to merge
          options = {
            body: {
              api_key: Rails.application.secrets.zoom_api_key,
              api_secret: Rails.application.secrets.zoom_api_secret,
              host_id: Rails.application.secrets.zoom_host_id,
              data_type: 'JSON'
            }
          }

          response = Faraday.post("api_url", @options)

          if File.exists?("name_of_created_merged_pdf")
            signed = SignedInvoice.new
            signed.invoice_numb = i.invoice_numb
            signed.order_numb = i.order_numb
            signed.save
          end
        end
      end
    end
  end
end
