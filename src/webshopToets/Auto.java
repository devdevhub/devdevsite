package webshopToets;

public class Auto {
	
	private String merk;
	private String type;
	private double prijs;
	private String fotoURL;
	
	public Auto() {
		
	}
	
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

	public void setMerk(String merk) {
		this.merk = merk;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setPrijs(double prijs) {
		this.prijs = prijs;
	}
	public void setFotoURL(String fotoURL) {
		this.fotoURL = fotoURL;
	}
	
}