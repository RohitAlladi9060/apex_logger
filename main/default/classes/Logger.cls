/**
 * @author Rohit Alladi
 * @date Nov 2017
 * @group Logger Interfaces
 * @group-content ../ApexDocContent/Interfaces.html
 * @description Interface for any type of logger
 **/
public interface Logger {

    //Logs a message at the DEBUG level
    void debug (String message);

    //Logs a message at the ERROR level
    void error (String message, Exception ex);

    //Logs a message at the ERROR level with parameters
    void error (String message, Exception ex, Object p0);

    //Logs a message at the ERROR level with parameters
    void error (String message, Exception ex, Object p0, Object p1);

    //Logs a message at the ERROR level with parameters
    void error (String message, Exception ex, Object p0, Object p1, Object p2);

    //Logs a messsage at the ERROR level with details encapsulated in a LogEventData object
    void error (LogEventData logData);

    //Logs a message at the FATAL level
    void fatal (String message);

    //Logs a message at the INFO level
    void info (String message);

    //Logs a message at the specified level
    void log (LogLevel level, String message);

    //Logs a message at the specified level with details encapsulated in a LogEventData object
    void log (LogEventData logData);

    //Logs a message with parameters at the specified level
    void log (LogLevel level, String message, Object p0);

    //Logs a message with parameters at the specified level
    void log (LogLevel level, String message, Object p0, Object p1);

    //Logs a message at the WARN level
    void warn (String message);

}