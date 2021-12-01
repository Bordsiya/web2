package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;

public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String xValue = req.getParameter("xVal");
        String yValue = req.getParameter("yVal");
        String rValue = req.getParameter("rVal");
        String param = req.getParameter("clear_table");
        if(xValue != null && yValue != null && rValue != null){
            Logger.getLogger("ControllerServlet").info("Doing point check");
            getServletContext().getRequestDispatcher("/areaCheck").forward(req, resp);
        }
        else if(param!= null && param.equals("true")){
            Logger.getLogger("ControllerServlet").info("Doing table clean");
            getServletContext().getRequestDispatcher("/clearTable").forward(req, resp);
        }
        else{
            Logger.getLogger("ControllerServlet").info("Going to index.jsp");
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
