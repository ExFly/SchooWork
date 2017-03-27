package org.exfly.logger;  

import org.apache.logging.log4j.LogManager;  
import org.apache.logging.log4j.Logger;  

public class TestLog {  
    public static void main(String[] args) {  
        Logger runinglogger = LogManager.getLogger("runing.test"); 
        Logger safelogger = LogManager.getLogger("safe.test"); 
        for(int i=0; i<10000000; i++) {
        	runinglogger.trace("trace");  
        	runinglogger.debug("debug");  
        	runinglogger.info("hello");  
        	runinglogger.warn("warn");  
        	runinglogger.error("error");  
        	runinglogger.fatal("fatal"); 
        	
        	safelogger.trace("trace");  
        	safelogger.debug("debug");  
        	safelogger.info("hello");  
        	safelogger.warn("warn");  
        	safelogger.error("error");  
        	safelogger.fatal("fatal");
        }
    }
}
