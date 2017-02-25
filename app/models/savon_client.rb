class SavonClient


  def self.call_service
    client = Savon.client(
        headers: {'Content-Type' => 'application/soap+xml;charset=UTF-16;action="http://tempuri.org/stuff/set_table_stuff"'},
        endpoint: 'https://api-co-qa.movilway.net:7803/Service/ExtendedApi/Public/ExtendedApi.svcl',
        namespace: 'http://api.movilway.net',
        #action: "http://api.movilway.net/schema/extended/IExtendedAPI/TopUp",
        env_namespace: :soapenv,
        namespace_identifier: :ext,
        ssl_version: :TLSv1,
        #element_form_default: :qualified,
        #ssl_verify_mode: :none,
        convert_request_keys_to: :camelcase,
        strip_namespaces: false,
        pretty_print_xml: true
    ) 
  

  client = Savon.client(
     wsdl: "https://api-co-qa.movilway.net:7803/Service/ExtendedApi/Public/ExtendedApi.svc?singleWsdl",
     basic_auth: ["user", "pass"],
     env_namespace: :soapenv,
     namespace_identifier: :ext,
     convert_request_keys_to: :camelcase,
     strip_namespaces: false,
     pretty_print_xml: true
     )
  client.operations
    response = client.call(:top_up,message: {
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
    #  [:TLSv1_2, :TLSv1_1, :TLSv1, :SSLv3, :SSLv23]
  end


    def self.call_service_2
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
        element_form_default: :qualified,
        soap_version: 1.1,
    )    
    response = client.call(:top_up,message: {
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