package com.bank;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {
	pointcut initBank1(): call(void Bank.moneyMakeTransaction());
	after(): initBank1(){
		try {
			FileWriter file = new FileWriter("log.txt",true);
			Calendar cal = Calendar.getInstance();
			
			file.write("Transacción, " +  cal.getTime() + "\n");
			file.close();
		}catch(IOException ex) {
			ex.printStackTrace();
		}
	}
	
}
