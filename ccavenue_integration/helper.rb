module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module CcavenueIntegration
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          # Replace with the real mapping
          mapping :account, 'KEY'
          mapping :amount, 'AMOUNT'

          mapping :order, 'ORDERID'
          mapping :currency, 'CURRENCY'
          mapping :merchant_id, 'Merchant_id'
          mapping :Redirect_url, 'Redirect_URL'
          mapping :working_key, 'Working_key'

          mapping :customer, :first_name => 'CFIRSTNAME',
                             :last_name  => 'CLASTNAME',
                             :email      => 'CEMAIL',
                             :phone      => 'CPHONE'

          mapping :billing_address, :city     => 'CCITY',
                                    :address1 => 'CADDRESS1',
                                    :address2 => 'CADDRESS2',
                                    :state    => 'CSTATE',
                                    :zip      => 'CZIPCODE',
                                    :country  => 'CCOUNTRY'

          mapping :notify_url, 'MC_callback'
          mapping :return_url, 'MC_return'
          mapping :cancel_return_url, 'URL'
          mapping :description, 'DESC'
          mapping :tax, 'TAX'
          mapping :shipping, 'SHIPPING'
        end
      end
    end
  end
end
