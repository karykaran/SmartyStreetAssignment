/*
* Class Name : ServiceClass
* Purpose : Service Class For Integration
* Date : 01-07-2020
* Author : Karan Sharma
*/
public class ServiceClass {
    /*
	* Method Name : makeHttpRequest
	* Purpose : Make Http Response to Dropbox From Salesforce
	* Parameter : String endPoint,Map<String,String> headers,String body
	* Return : HttpResponse
	*/
    public static HttpResponse makeHttpRequest(String endPoint,String method,Map<String,String> headers,String body){
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPoint);
        request.setMethod(method);
        request.setTimeout(120*1000);
        for(String header : headers.keySet()){
            request.setHeader(header,headers.get(header));
        }
        if(body != ''){
            request.setBody(body);
        }
        Http h = new Http();
        HttpResponse response;
        try{
            response = h.send(request);
            return response;
        }
        catch(Exception e){
            return null;
        }
    }
}