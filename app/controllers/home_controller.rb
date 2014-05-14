class HomeController < ApplicationController
  
  def index
   
    # @ccavenue = Entry.all
   orderID = 56789.to_s

    amount = 01.to_s
    
    name = 'test'
    street_address = 'A39'
    country = 'india'
    cell_phone = '9696548475'
    email = 'xyz@gmail.com'
    state = 'rajasthan'
    current_user_name = 'test1'
    city ='jaipur'
    pincode = 302022
    
   #  orderID = to_query('orderID').to_s

   # amount = to_query('amount')
    
  #  name = to_query('name')
   # street_address = to_query('street_address')
  #  country = to_query('country')
  #  cell_phone = to_query('cell_phone')
    
   # email = to_query('email')
  #  state = to_query('state')
   # current_user_name = to_query('current_user_name')
   # city =to_query('city')
   # pincode = to_query('pincode')
    

     redirectURL = "http://real.hostingcentre.in/ruby/test.php/transactions/"+56789.to_s+"/ccavenue_redirect"

    checksum = getChecksum("M_demo1_1828", orderID, amount, redirectURL, "ekvb7aezafo9r38ikfdfzrvy6srsl8st")

    @ccaRequest = 

      "Merchant_Id=M_demo1_1828&"+

      "Amount="+amount+"&"+

      "Order_Id="+orderID+"&"+

		"Redirect_Url="+redirectURL+"&"+

      "billing_cust_name="+name+"&"+

      "billing_cust_address="+street_address+"&"+

      "billing_cust_country="+country+"&"+

      "billing_cust_tel="+cell_phone+"&"+

      "billing_cust_email="+email+"&"+

      "billing_cust_state="+state+"&"+

      "delivery_cust_name="+current_user_name+"&"+

      "delivery_cust_address="+street_address+"&"+

      "delivery_cust_country="+country+"&"+

      "delivery_cust_state="+state+"&"+

      "delivery_cust_tel="+cell_phone+"&"+

      "delivery_cust_notes="+"Note"+"&"+

      "billing_cust_city="+city+"&"+

      "billing_zip_code="+pincode.to_s+"&"+

      "delivery_cust_city="+city+"&"+

      "delivery_zip_code="+pincode.to_s+"&"+

      "Checksum="+checksum.to_s
      
  
    Dir.chdir("c:/Sites/rails_projects/ccavenue/public/jar/") do

      @encRequest = %x[java -jar ccavutil.jar #{'ekvb7aezafo9r38ikfdfzrvy6srsl8st'} "#{@ccaRequest}" enc]

    end
  
  end
  
  
  def ccavenue_redirect

    @encResponse = params[:encResponse]

    @checksum = false

    @authDesc = false

    @p = nil

    @ccaResponse = nil

    if (params[:encResponse])

            if @encResponse

        Dir.chdir("c:/Sites/rails_projects/ccavenue/public/jar/") do

               @ccaResponse = %x[java -jar ravi-ccavutil.jar #{'ekvb7aezafo9r38ikfdfzrvy6srsl8st'} "#{@encResponse}" dec]

        end

        @p = Rack::Utils.parse_nested_query @ccaResponse

        if (!@p.nil? && @p["Merchant_Id"] && @p["Order_Id"] && @p["Amount"] && @p["AuthDesc"] && @p["Checksum"])

          @checksum = verifyChecksum(@p["Merchant_Id"], @p["Order_Id"], @p["Amount"], @p["AuthDesc"], 'ekvb7aezafo9r38ikfdfzrvy6srsl8st', @p["Checksum"])

          @authDesc = @p["AuthDesc"].eql?("Y") ? true : false

        end

      end

      if @checksum && @authDesc 

        transaction = Transaction.find(@p["Order_Id"])

        transaction.payment_confirmed = true

        transaction.save!

        message = current_buyer.user.name + "! Thank you for your order! It will soon be at your doorsteps!" 

        redirect_to root_path, :flash => {:success => message}

      else

        if !@authDesc

          message = current_buyer.user.name + "! Your bank did not authorize the transaction. Please go to Settings > My Orders page, and click on 'Pay Now' button to finish your transaction" 

          redirect_to root_path, :flash => {:error => message}

        else

          message = current_buyer.user.name + "! Oops! There was some error in retrieving your transaction confirmation. Please drop us an email at dealbuddie@dealbuddie.com for order confirmation."

          redirect_to root_path, :flash => {:error => message}

        end

      end

    else

      message = current_buyer.user.name + "! Oops! Something went wrong while processing your request. Please go to Settings > My Orders page, and click on 'Pay Now' button to finish your transaction."

      redirect_to root_path, :flash => {:success => message}

    end

  end
  
  def getChecksum( merchantID,  orderID,  amount,  redirectUrl,  workingKey) 

    String str = merchantID + "|" + orderID + "|" + amount + "|" + redirectUrl + "|" + workingKey;

    return Zlib::adler32(str)

  end  
  
  def verifyChecksum( merchantID,  orderID,  amount,  authDesc,  workingKey,  checksum) 

    String str = merchantID+"|"+orderID+"|"+amount+"|"+authDesc+"|"+workingKey

    String newChecksum = Zlib::adler32(str).to_s

    return (newChecksum.eql?(checksum)) ? true : false

  end
    


end
