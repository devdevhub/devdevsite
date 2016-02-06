package javapack;

public class TemperatureConversion {
	
	public TemperatureConversion() {
		
	}
	
	public long convCtoF(String inputC) throws NumberFormatException {
		int celsius = Integer.parseInt(inputC);
		return Math.round(celsius*1.8+32);
	}
	
	public long convFtoC(String inputF) throws NumberFormatException {
		int fahrenheit = Integer.parseInt(inputF);
		return Math.round((fahrenheit-32)/1.8);
	}
	
}