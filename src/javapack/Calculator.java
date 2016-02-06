package javapack;

public class Calculator {
	
	private double doubleResult;
	private String stringResult;
	
	public Calculator() {
		
	}
	
	public String add(String s1, String s2) throws NumberFormatException {
		doubleResult = Double.parseDouble(s1)+Double.parseDouble(s2);
		checkIntDouble();
		return stringResult;
	}
	
	public String subtract(String s1, String s2) throws NumberFormatException {
		doubleResult = Double.parseDouble(s1)-Double.parseDouble(s2);
		checkIntDouble();
		return stringResult;
	}
	
	public String multiply(String s1, String s2) throws NumberFormatException {
		doubleResult = Double.parseDouble(s1)*Double.parseDouble(s2);
		checkIntDouble();
		return stringResult;
	}
	
	public String divide(String s1, String s2) throws NumberFormatException {
		doubleResult = Double.parseDouble(s1)/Double.parseDouble(s2);
		checkIntDouble();
		return stringResult;
	}
	
	public void checkIntDouble() {
		if (doubleResult == (int)(doubleResult)) {
			stringResult = String.format("%.0f", doubleResult);
		}
		else {stringResult = ""+doubleResult;}
	}
	
}