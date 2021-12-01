package model;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import java.util.logging.Logger;

public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long enterTime = System.nanoTime();

        String stringX = req.getParameter("xVal");
        String stringY = req.getParameter("yVal");
        String stringR = req.getParameter("rVal");

        if (isValid(stringX, stringY, stringR)){
            Logger.getLogger("AreaCheckServlet").info("Valid data");
            if (stringY.length() > 10) stringY = stringY.substring(0, 9);

            double xValue = Double.parseDouble(stringX);
            double yValue = Double.parseDouble(stringY);
            double rValue = Double.parseDouble(stringR);

            boolean isHit = checkHit(xValue, yValue, rValue);

            TimeZone timeZone = TimeZone.getTimeZone("Europe/Moscow");
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new Date());
            SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
            sdf.setTimeZone(timeZone);

            String currentTime = sdf.format(calendar.getTime());
            String workingTime = String.valueOf(System.nanoTime() - enterTime);

            Point point = new Point(xValue, yValue, rValue, currentTime, workingTime, isHit);

            HttpSession session = req.getSession();
            PointsList pointsList = (PointsList) session.getAttribute("points");
            if (pointsList == null) pointsList = new PointsList();
            pointsList.getPoints().add(point);
            session.setAttribute("points", pointsList);

            resp.sendRedirect(req.getContextPath() + "/table.jsp");

        }
        else{
            Logger.getLogger("AreaCheckServlet").info("Not valid data");
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    private boolean isValid(String stringX, String stringY, String stringR){
        return isValidX(stringX) && isValidY(stringY) && isValidR(stringR);
    }

    private boolean isValidX(String stringX){
        String[] xValues = {"-5", "-4", "-3", "-2", "-1", "0", "1", "2", "3"};
        return Arrays.asList(xValues).contains(stringX);
    }

    private boolean isValidY(String stringY){
        try{
            if (stringY.length() > 10) stringY = stringY.substring(0, 9);
            double yValue = Double.parseDouble(stringY);
            return yValue > -5 && yValue < 3;
        } catch (NumberFormatException e){
            return false;
        }
    }

    private boolean isValidR(String stringR){
        String [] rValues = {"1", "2", "3", "4", "5"};
        return Arrays.asList(rValues).contains(stringR);
    }

    private boolean checkHit(double xValue, double yValue, double rValue){
                //rectangle
        return (xValue >= 0 && xValue <= rValue && yValue >= 0 && yValue <= rValue) ||
                //triangle
                (xValue >= 0 && xValue <= rValue && yValue <= 0 && yValue >= xValue - rValue) ||
                //circle
                (xValue <= 0 && xValue >= -rValue && yValue <= 0 && xValue * xValue + yValue * yValue <= rValue * rValue);
    }
}
