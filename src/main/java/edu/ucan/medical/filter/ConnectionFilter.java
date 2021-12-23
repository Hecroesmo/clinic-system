package edu.ucan.medical.filter;

import edu.ucan.medical.connection.ConnectionFactory;
import java.io.IOException;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * @author tio-hecro
 */

@WebFilter("/*")
public class ConnectionFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
        FilterChain chain) throws IOException, ServletException 
    {        
        try 
        {
            Connection connection;
            connection = new ConnectionFactory(
                    "jdbc:postgresql://localhost:5432/medical-system",
                    "postgres", "postgres", "org.postgresql.Driver").getConnection();
            
            request.setAttribute("connection", connection);
            chain.doFilter(request, response);
            connection.close();
        }
        catch (Exception ex) {
            Logger.getLogger(
                ConnectionFilter.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void destroy() {
        
    }
}
