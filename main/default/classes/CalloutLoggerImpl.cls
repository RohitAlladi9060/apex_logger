/**
 * @author Rohit Alladi
 * @date  11/14/2017.
 * @group-content ../ApexDocContent/Classes.html
 * @description This class is used for implementing Logger interface and has callout log methods.
 **/
public with sharing class CalloutLoggerImpl implements Logger{

    private String logName;
    private LogWriter logWriter;

    public CalloutLoggerImpl(String logName, LogWriter logWriter) {
        this.logName = logName;
        this.logWriter = logWriter;
    }

    //TODO: Finish default implementation. XF

    /**
     * debug overloads
     */

    public void debug (String message){
        LogEventData led = new LogEventData();
        led.message = message;
        led.level = LogLevel.DEBUG;
        logWriter.writeToCustomObject('Log__c', null, led);
    }

    /**
     * error method overloads
     */

    public void error (String message, Exception ex){}

    public void error (String message, Exception ex, Object p0){}

    public void error (String message, Exception ex, Object p0, Object p1){}

    public void error (String message, Exception ex, Object p0, Object p1, Object p2){}

    public void error (LogEventData logData){}

    /**
     * fatal method overloads
     */

    public void fatal (String message){}

    /**
     * info method overloads
     */

    public void info (String message){}

    /**
     * log method overloads
     */

    public void log (LogLevel level, String message){}

    public void log (LogLevel level, String message, Object p0){}

    public void log (LogLevel level, String message, Object p0, Object p1){}

    public void log (LogEventData logData) {
        logWriter.writeToCustomObject('Log__c', null, logData);
    }

    /**
     * warn method overloads
     */

    public void warn (String message){}
}