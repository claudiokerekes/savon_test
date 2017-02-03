class SavonClient


  def self.call_service
    client = Savon.client(
        endpoint: 'https://api-co-qa.movilway.net:7803/Service/ExtendedApi/Public/ExtendedApi.svc',
        namespace: 'http://api.movilway.net/',
        convert_request_keys_to: :camelcase,
        env_namespace: :soapenv,
        namespace_identifier: :ext,
        log: true,
        ssl_verify_mode: :none,
        ssl_version: :TLSv1,
        pretty_print_xml: true,
        ssl_version: :TLSv1,
        element_form_default: :qualified,
        soap_version: 1,
    )    
    response = client.call(:top_up_request,message: {
     "ext:AuthenticationData" => {
      "ext:Username"=> "user",
      "ext:Password" => "pass"
     },
    "ext:DeviceType" => 3,
    "ext:Platform"=> 1,
    "ext:Amount"=> "2000",
    "ext:ExternalTransactionReference"=>"1234567890",
    "ext:MNO"=>"1",
    "ext:Recipient"=>"3001234200",
    "ext:WalletType"=>"Stock",
    "ext:TerminalID"=>"45"
    }
    )
    response
  end
end