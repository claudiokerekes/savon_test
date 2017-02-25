require 'soap/wsdlDriver'
class Driverck
  def self.call_service
    client = SOAP::WSDLDriverFactory.new( 'https://api-co-qa.movilway.net:7803/Service/ExtendedApi/Public/ExtendedApi.svc?' ).create_rpc_driver
    result = client.doStuff();
  end
end