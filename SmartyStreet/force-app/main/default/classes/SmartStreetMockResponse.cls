@isTest
public with sharing class SmartStreetMockResponse implements HttpCalloutMock{
    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('[{"input_index":"0"},{"input_index":"1"},{"input_index":"4"}]');
        res.setStatusCode(200);
        return res;
    }
}