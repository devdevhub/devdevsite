package javapack;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.*;

import webshopToets.MoneyFormat;
import webshopToets.Auto;
import webshopToets.AutoLijst;

@SuppressWarnings("serial")
public class V8_X2025989Servlet extends HttpServlet {
	
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
					out.print("<script>");
						out.print("$('input[value='"+item+"']').attr('checked', 'checked');");
					out.print("</script>");
			}
		}
		else {
			out.print("<script>");
				out.print("$('#allBrandsCheckbox').attr('checked', 'checked');");
			out.print("</script>");
		}
		
		try {
			for (Auto car : list.getLijst()) {
				boolean foundBrand = false;
				for (int i = 0; i < checkList.length && foundBrand == false; i++) {
					if (car.getMerk().equalsIgnoreCase(checkList[i])) {
						foundBrand = true;
					} 
				}
				if (
					(
						foundBrand == true
						|| request.getParameter("brand") == null
						|| request.getParameter("brand").equalsIgnoreCase("Alle merken")
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