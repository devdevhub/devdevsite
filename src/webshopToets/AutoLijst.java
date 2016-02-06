package webshopToets;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Klasse met een lijst van auto's
 * @author piet
 */
public class AutoLijst {
	
	private ArrayList<Auto> autolijst;
	private ArrayList<Auto> autolijstSorted;
	private double[] prijslijst;
	
	/**
	 * Constructor die de lijst aanmaakt en auto's toevoegt
	 */
	public AutoLijst() {
		autolijst = new ArrayList<Auto>();
		autolijst.add(new Auto("Ford", "Fiesta", 23999, "img/fordfiesta.jpg"));
		autolijst.add(new Auto("Ford", "Focus", 18995, "img/fordfocus.jpg"));
		autolijst.add(new Auto("Opel", "Astra", 14895, "img/opelastra.jpg"));
		autolijst.add(new Auto("Opel", "Insignia", 65450, "img/opelinsignia.jpg"));
		autolijst.add(new Auto("Subaru", "Forester", 34750, "img/subaruforester.jpg"));
		autolijst.add(new Auto("Subaru", "Impreza", 28345, "img/subaruimpreza.jpg"));
		autolijst.add(new Auto("Mercedes", "E 63", 110995, "img/mercedede63.png"));
		autolijst.add(new Auto("Mercedes", "CLA 45", 190780, "img/mercedescla45.jpg"));
		autolijst.add(new Auto("Mercedes", "E 230", 1000, "img/mercedese230.jpg"));
		autolijst.add(new Auto("Mercedes", "C 250", 599, "img/mercedesc250.jpg"));
		autolijst.add(new Auto("Ferrari", "612 GTO", 350500, "img/ferrari612.jpg"));
		autolijst.add(new Auto("Ferrari", "California", 210780, "img/ferraricalifornia.jpg"));
		autolijst.add(new Auto("Ferrari", "458", 280775, "img/ferrari458.jpg"));
		autolijst.add(new Auto("Lotus", "Elise CR", 48591, "img/lotuselisecr.jpg"));
		autolijst.add(new Auto("Lotus", "Elise S CR", 60079, "img/lotuselisescr.jpg"));
		autolijst.add(new Auto("Citroen", "2CV", 459, "img/citroen2cv.jpg"));
		autolijst.add(new Auto("Volvo", "V40", 1250, "img/volvov40.jpg"));
		autolijst.add(new Auto("Mini", "Cooper", 34495, "img/minicooper.jpg"));
		
		prijslijst = new double[autolijst.size()];
		for (int i = 0; i < prijslijst.length; i++) {
			prijslijst[i] = autolijst.get(i).getPrijs();
		}
		Arrays.sort(prijslijst);
		autolijstSorted = new ArrayList<Auto>();
		for (double prijs : prijslijst) {
			for (Auto car : autolijst) {
				if (prijs == car.getPrijs()) {
					autolijstSorted.add(car);
				}
			}
		}
	}
	
	/**
	 * @return geeft de lijst met auto's
	 */
	public ArrayList<Auto> getLijst() {
		return autolijstSorted;
	}
	
	/**
	 * Ten behoeve van het select merk input veld
	 * @return een lijst met alle unieke merken
	 */
	public ArrayList<String> getMerken() {
		ArrayList<String> merken = new ArrayList<String>();
		for (Auto auto : autolijstSorted) {
			if (!merken.contains(auto.getMerk())) {
				merken.add(auto.getMerk());
			}
		}
		return merken;
	}
	
}