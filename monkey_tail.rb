require 'savon'

client = Savon::Client.new(wsdl: 'http://localhost:3008/')

message = {:modelFields => {"AARAnalysis" => ""},:operation => "list", :objectname => "", :qualifier => ""}

response = client.call(:submit_request, message: messsage)
