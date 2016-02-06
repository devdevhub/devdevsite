package javapack;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.http.*;

import webshopToets.MoneyFormat;
import webshopToets.Auto;
import webshopToets.AutoLijst;

@SuppressWarnings("serial")
public class V9_X2025989Servlet extends HttpServlet {
	
	AutoLijst list = new AutoLijst();
	MoneyFormat mf = new MoneyFormat();
	PrintWriter out;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		out = response.getWriter();
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		out = response.getWriter();
		fillCarsWrapper(request, response);
	}
	
	public void fillCarsWrapper(HttpServletRequest request, HttpServletResponse response) {
		String[] checkList = new String[0];
		if (request.getParameterValues("brand") != null) {
			checkList = request.getParameterValues("brand");
			for (String item : checkList) {
				System.out.println(item);
			}
			System.out.println("----------");
		}
		else {
			System.out.println("NONE FOUND");
		}
		
		
//		String[] checkList = new String[0];
//		if (request.getParameterValues("brand") != null) {
//			checkList = request.getParameterValues("brand");
//			for (String item : checkList) {
//				out.print("<script>");
//					out.print("$('input[value='"+item+"']').attr('checked', 'checked');");
//				out.print("</script>");
//				out.println(item);
//			}
//		}
//		else {
//			out.print("<script>");
//				out.print("$('#allBrandsCheckbox').attr('checked', 'checked');");
//			out.print("</script>");
//		}
		
//		boolean[] checkList = null;
//		if (request.getParameterValues("brand") != null) {
//		checkList = new boolean[request.getParameterValues("brand").length];
//			for (boolean item : checkList) {
//				System.out.println(item);
//				System.out.println("-----");
//			}
//		}
//		else {
//			out.print("<script>");
//				out.print("$('#allBrandsCheckbox').attr('checked', 'checked');");
//			out.print("</script>");
//		}
		
		
		
		
		
		
		try {
			for (Auto car : list.getLijst()) {
//				Auto car = list.getLijst().get(i);
//				if (Arrays.asList(checkList).contains(car.getMerk())) {
//					System.out.println(car.getMerk()+" "+car.getType());
//				}
//				for (String item : checkList) {
//					if (item.equalsIgnoreCase(car.getMerk())) {
//						System.out.println(car.getMerk()+" "+car.getType());
//					}
//					else {System.out.println("NOT FOUND: "+car.getMerk()+" "+car.getType());}
//				}
//				boolean foundBrand = false;
//				for (int i = 0; i < checkList.length && foundBrand == false; i++) {
//					if (car.getMerk().equalsIgnoreCase(checkList[i])) {
//						foundBrand = true;
//						System.out.println(car.getMerk()+" "+car.getType());
//					} 
//				}
//				for (int i = 0; i < checkList.length; i++) {
//					if (car.getMerk().equalsIgnoreCase(checkList[i])) {
//						foundBrand = true;
//						System.out.println(car.getMerk()+" "+car.getType());
//					} 
//				}
				if (
//					(
//						checkList[i] == true
//						foundBrand == true
//						Arrays.asList(checkList).contains(car.getMerk())
//						|| request.getParameterValues("brand") == null
//						|| request.getParameterValues("brand")[0].equalsIgnoreCase("Alle merken")
//						checkList[0].equalsIgnoreCase("Alle merken")
//					)
//					|| 
					(
						request.getParameter("minHidden") == null
						|| request.getParameter("minHidden").equals("")
						|| Double.parseDouble(request.getParameter("minHidden")) <= car.getPrijs()
					)
					&& (
						request.getParameter("maxHidden") == null
						|| request.getParameter("maxHidden").equals("")
						|| Double.parseDouble(request.getParameter("maxHidden")) >= car.getPrijs()
					)
				) {
//					System.out.println(car.getMerk()+" "+car.getType());
					out.print("<div class='car'>");
						out.print("<div class='carTitle'>"+car.getMerk()+" "+car.getType()+"</div>");
						out.print("<div class='carBody'>");
							out.print("<img src='"+car.getFoto()+"'></img>");
							out.print("<p class='price'>&euro; "+mf.getPrijsFormat(car.getPrijs())+"</p>");
						out.print("</div>");
					out.print("</div>");
				}
			}
		}
		catch (NumberFormatException e) {
			out.print("<p id='error'>Error. Try using an integer instead.</p>");
			out.print("<script>");
				out.print("$('input[type='text']').val('');");
			out.print("</script>");
		}
	}
	
}