package webshopToets;

import java.util.ArrayList;
import java.util.Date;

import org.mortbay.log.Log;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
//import com.google.appengine.api.datastore.Query.FilterPredicate;
//import com.google.appengine.api.datastore.Query.FilterOperator;

import webshopToets.Auto;
//import webshopToets.AutoLijst;

public class AutoIO {
	
    private DatastoreService datastore;
//    private AutoLijst carList;
	
	public AutoIO() {
		datastore = DatastoreServiceFactory.getDatastoreService();
//		carList = new AutoLijst();
	}
	
	public void updateCar(String brand, String model, double price, String photoURL) {
    	Entity ent = new Entity("Auto", brand+" "+model);
        ent.setProperty("Merk", brand);
        ent.setProperty("Type", model);
        ent.setProperty("Prijs", price);
        ent.setProperty("FotoURL", photoURL);
        datastore.put(ent);
	}
	
	public ArrayList<Auto> getCarArray() {
//		return (ArrayList<Auto>)(datastore.prepare(new Query("Auto")).asIterable());
		ArrayList<Auto> carArray = new ArrayList<Auto>();
		for (Entity ent : datastore.prepare(new Query("Auto")).asIterable()) {
//			System.out.println(ent.getKey());
//			carArray.add(getCar(ent.getKey().toString()));
//			String merk = ent.getProperty("Merk").toString();
//			String type = ent.getProperty("Type").toString();
//			double prijs = (double)(ent.getProperty("Prijs"));
//			String fotoURL = ent.getProperty("FotoURL").toString();
//			System.out.print("TEST");
//			Log.info("test2");
//			Auto auto = new Auto(merk, type, prijs, fotoURL);
			carArray.add(new Auto(
				ent.getProperty("Merk").toString(),
				ent.getProperty("Type").toString(),
				(double)(ent.getProperty("Prijs")),
				ent.getProperty("FotoURL").toString()
			));
		}
//		carArray.add(new Auto("test1", "test1", 10000, "test1"));
//		carArray.add(new Auto("test2", "test2", 20000, "test2"));
//		carArray.add(new Auto("test3", "test3", 30000, "test3"));
		return carArray;
	}
//
	public Auto getCar(String carCode) {
		Auto car = null;
		try {
			Entity ent = datastore.get(KeyFactory.createKey("Auto", carCode));
			car = new Auto();
			car.setMerk(ent.getProperty("brand").toString());
			car.setType(ent.getProperty("model").toString());
			car.setPrijs(Double.parseDouble(ent.getProperty("price").toString()));
			car.setFotoURL(ent.getProperty("photoURL").toString());
		}
		catch (EntityNotFoundException e) {}
		return car;
	}
    
	
	
	
	
	
//    public void updateLid(Lid lid) {
//        Entity ent = new Entity("Lid", lid.getSpelerscode());
//        ent.setProperty("spelerscode", lid.getSpelerscode());
//        ent.setProperty("roepnaam", lid.getRoepnaam());
//        ent.setProperty("tussenvoegsels", lid.getTussenvoegsels());
//        ent.setProperty("achternaam", lid.getAchternaam());
//        ent.setProperty("email", lid.getEmail());
//        ent.setProperty("geb_datum", lid.getGeb_datum());
//        datastore.put(ent);
//    }
//    
//    public void verwijderLid(String spelerscode) {
//    	datastore.delete(KeyFactory.createKey("Lid", spelerscode));
//    }
//    
//    public Lid getLid(String spelerscode)  {
//    	Lid lid = null;
//    	try {
//    		Entity ent = datastore.get(KeyFactory.createKey("Lid", spelerscode));
//    		lid = new Lid();
//    		lid.setSpelerscode(ent.getProperty("spelerscode").toString());
//    		lid.setRoepnaam(ent.getProperty("roepnaam").toString());
//    		lid.setTussenvoegsels(ent.getProperty("tussenvoegsels").toString());
//    		lid.setAchternaam(ent.getProperty("achternaam").toString());
//    		lid.setEmail(ent.getProperty("email").toString());
//    		lid.setGeb_datum((Date)(ent.getProperty("geb_datum")));
//    	}
//    	catch (EntityNotFoundException e) {}
//    	return lid;
//    }
//    
//    public ArrayList<Lid> getAlleLeden() {
//        ArrayList<Lid> leden = new ArrayList<Lid>();
//        for (Entity ent : datastore.prepare(new Query("Lid")).asIterable()) {
//            leden.add(getLid(ent.getProperty("spelerscode").toString()));
//        }
//        return leden;
//    }
//    
//    public void setTeamspeler(Team team, Lid lid) {
//    	Entity ent = new Entity("Teamspeler", team.getTeamcode()+lid.getSpelerscode());
//    	ent.setProperty("teamcode", team.getTeamcode());
//    	ent.setProperty("spelerscode", lid.getSpelerscode());
//    	datastore.put(ent);
//    }
//    
//    public ArrayList<Lid> getTeamspelers(Team team)  {
//        ArrayList<Lid> teamleden = new ArrayList<Lid>();
//        for (Entity ent : datastore.prepare(new Query("Teamspeler").setFilter(new FilterPredicate("teamcode", FilterOperator.EQUAL, team.getTeamcode()))).asIterable()) {
//            teamleden.add(getLid(ent.getProperty("spelerscode").toString()));
//        }
//        return teamleden;
//    }
//    
//    public void updateTeam(Team team) {
//        Entity ent = new Entity("Team", team.getTeamcode());
//        ent.setProperty("teamcode", team.getTeamcode());
//        ent.setProperty("teamnaam", team.getTeamnaam());
//        datastore.put(ent);
//    }
//    
//    public void verwijderTeam(String teamcode) {
//    	datastore.delete(KeyFactory.createKey("Team", teamcode));
//    }
//    
//    public Team getTeam(String teamcode)  {
//    	Team team = null;
//    	try {
//    		Entity ent = datastore.get(KeyFactory.createKey("Team", teamcode));
//    		team = new Team(
//				ent.getProperty("teamcode").toString(),
//				ent.getProperty("teamnaam").toString()
//			);
//    	}
//    	catch (EntityNotFoundException e) {}
//    	return team;
//    }
//    
//    public ArrayList<Team> getAlleTeams() {
//        ArrayList<Team> teams = new ArrayList<Team>();
//        for (Entity ent : datastore.prepare(new Query("Team")).asIterable()) {
//            teams.add(getTeam(ent.getProperty("teamcode").toString()));
//        }
//        return teams;
//    }
//    
}