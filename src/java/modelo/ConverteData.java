/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author 13480309682
 */
public class ConverteData {
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    Calendar cal = Calendar.getInstance();
    
    SimpleDateFormat mhdm = new SimpleDateFormat("mm:kk dd/MM/yyyy");
    

    public static Date somarData(int dias, Date data) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(data);
        calendar.add(Calendar.DATE, dias);
        return calendar.getTime();
    }

    public String dataAtual() {
        return sdf.format(new Date());
    }
    public String horaAtual() {
        return mhdm.format(new Date());
    }

    public Calendar converteCalendario(String data) {
        try {
            cal.setTime(sdf.parse(data));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return cal;
    }
    public Calendar converteCalendario2(String data) {
        try {
            cal.setTime(mhdm.parse(data));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return cal;
    }

    public Calendar converteCalendario(Date data) {
        Calendar dataCal = Calendar.getInstance();
        dataCal.setTime(data);
        return dataCal;
    }

    public String converteTela(Object value) {
        Calendar c = (Calendar) value;
        return sdf.format(c.getTime());
    }
    public String converteTela2(Object value) {
        Calendar c = (Calendar) value;
        return mhdm.format(c.getTime());
    }
    
     public java.sql.Date converteBanco(Object value) {
        Calendar c = (Calendar) value;
       return  new java.sql.Date(c.getTimeInMillis());
    }
     
}
