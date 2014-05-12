class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      
      t.integer :MerchantId
      t.integer :Amount
      t.integer :Order_Id
      t.string  :Redirect_Url
      t.integer :WorkingKey
      t.string  :billing_cust_name
      t.string  :billing_cust_address
      t.string  :billing_cust_state
      t.string  :billing_cust_country
      t.string  :billing_cust_tel
      t.string  :billing_cust_email
      t.string  :delivery_cust_name
      t.string  :delivery_cust_address
      t.string  :delivery_cust_state
      t.string  :delivery_cust_country
      t.string  :delivery_cust_tel
      t.string  :delivery_cust_notes
      t.string  :Merchant_Param
      t.string  :billing_city  
      t.string  :billing_zip   
      t.string  :delivery_city
      t.string  :delivery_zip
      
      t.timestamps
    end
  end
end
