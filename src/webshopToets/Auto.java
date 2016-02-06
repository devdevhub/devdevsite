package webshopToets;

public class Auto {
	
	private final String merk;
	private final String type;
	private final double prijs;
	private final String fotoURL;
	
	public Auto(String merk, String type, double prijs, String fotoURL) {
		this.merk = merk;
		this.type = type;
		this.prijs = prijs;
		this.fotoURL = fotoURL;
	}
	
	public String getMerk() {
		return merk;
	}
	
	public String getType() {
		return type;
	}
	
	public double getPrijs() {
		return prijs;
	}
	
	public String getFoto() {
		return fotoURL;
	}
	
}