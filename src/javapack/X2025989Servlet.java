package javapack;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import webshopToets.MoneyFormat;
import webshopToets.Auto;
import webshopToets.AutoIO;
import webshopToets.AutoLijst;

@SuppressWarnings("serial")
public class X2025989Servlet extends HttpServlet {
	
	AutoLijst list = new AutoLijst();
	MoneyFormat mf = new MoneyFormat();
	PrintWriter out;
	AutoIO io;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		out = response.getWriter();
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		if (request.getParameter("addCar") != null) {
			io = new AutoIO();
			io.updateCar(
				request.getParameter("brand"),
				request.getParameter("model"),
				Double.parseDouble(request.getParameter("price")),
				request.getParameter("photoURL")
			);
			list.updateLijst();
			request.getRequestDispatcher("v14_index.jsp").forward(request, response);
		}
		
//		list = io.getCarArray();
		out = response.getWriter();
		String checkList = "";
		ArrayList<String> checkArray = new ArrayList<String>();
		if (request.getParameterValues("brand") != null) {
			checkList = request.getParameterValues("brand")[0];
			checkList = checkList.replaceAll("[\"\\[\\]]", "");
			checkArray.clear();
			for (String item : checkList.split(",")) {
				checkArray.add(item);
			}
		}
		
		for (Auto car : list.getLijst()) {
			String carNoteID = (car.getMerk()+"-"+car.getType()).replaceAll(" ", "-");
			boolean foundBrand = false;
			for (int i = 0; i < checkArray.size() && foundBrand == false; i++) {
				if (car.getMerk().equalsIgnoreCase(checkArray.get(i))) {
					foundBrand = true;
				}
			}
			if (
				(
					foundBrand
					|| checkArray.get(0).equalsIgnoreCase("All brands")
				)
				&& (
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
				out.print("<div class='car'>");
					out.print("<div class='carTitle'>"+car.getMerk()+" "+car.getType()+"</div>");
					out.print("<div class='carBody'>");
						out.print("<img src='"+car.getFoto()+"'></img>");
						out.print("<p class='price'>&euro; "+mf.getPrijsFormat(car.getPrijs())+"</p>");
					out.print("</div>");
				out.print("</div>");
			}
			out.print("<script>");
				out.print("$('#"+carNoteID+"').show();");
			out.print("</script>");
			if (
				!foundBrand
				&& !checkArray.get(0).equalsIgnoreCase("All brands")
			){
				out.print("<script>");
					out.print("$('#"+carNoteID+"').hide();");
				out.print("</script>");
			}
		}
	}
	
}