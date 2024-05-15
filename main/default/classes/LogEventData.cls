/**
 * @author Rohit Alladi
 * @date Nov 2017
 * @group Logger Classes
 * @group-content ../ApexDocContent/Classes.html
 * @description DTO (properties only) that contains data about a log event
 **/
public class LogEventData {

    public String logName {get;set;}
    public String message {get;set;}
    public LogLevel level {get;set;}
    public Object[] logParameters {get;set;}
    public string calloutEndpoint {get;set;}
    public string errorCode {get;set;}
    public string httpMethod {get;set;}
    public string request {get;set;}
    public string response {get;set;}
    public string stackTrace {get;set;}
    public string userId {get;set;}

    //TODO: Add other log event properties here. XF
}