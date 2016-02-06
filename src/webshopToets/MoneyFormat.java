package webshopToets;


import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

public class MoneyFormat {
	
	
	public MoneyFormat() {
		
	}
	
	/**
	 * @return geeft prijs als geformatteerde String
	 */
	public String getPrijsFormat(double prijs) {
		DecimalFormat df = (DecimalFormat)(
			NumberFormat.getNumberInstance(new Locale("de", "DE"))
		);
		df.applyPattern("#,##0.-");
		return df.format(prijs);
	}
	
}