package org.ssm_tts.filter;



import org.ssm_tts.entity.Admin;
import org.ssm_tts.entity.Power;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author xujin
 * @package-name org.tts.util
 * @create 2019-08-18 16:03
 */
@WebFilter(filterName = "RequestFilter",urlPatterns = {"/login/*","/user/*","/role/*","/admin/*","/fee/*","/account/*","/service/*","/bill/*","/report/*"},
           initParams = {@WebInitParam(name = "url",value = "login.jsp;error.jsp;nopower.jsp;getImage;goIndex"),
                         @WebInitParam(name = "path",value = "loginIndex;user_info;user_modi_pwd;exit;updateAdmin;updatePwd")})
public class RequestFilter implements Filter {
    private String url;
    private String path;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.url=filterConfig.getInitParameter("url");
        this.path=filterConfig.getInitParameter("path");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request= (HttpServletRequest) servletRequest;
        HttpServletResponse response= (HttpServletResponse) servletResponse;
        String[] urlArray=url.split(";");
        System.out.println(request.getRequestURI());
        if(urlArray!=null&&urlArray.length>0){
            for (String s : urlArray) {
                if(s==null||"".equals(s)) continue;;
                if(request.getRequestURI().indexOf(s)!=-1){
                    filterChain.doFilter(request,response);
                    return;
                }
            }
        }
        if(request.getSession().getAttribute("admin1")!=null){
            String[] pathArray=path.split(";");
            if(pathArray!=null&&pathArray.length>0){
                for (String p : pathArray) {
                    if(p==null||"".equals(p)) continue;;
                    if(request.getRequestURI().indexOf(p)!=-1){
                        filterChain.doFilter(request,response);
                        return;
                    }
                }
            }
            List<Power> powerList=((Admin)request.getSession().getAttribute("admin1")).getPowerList();
            for (Power power : powerList) {
                if(request.getRequestURI().indexOf(power.getPclass())!=-1){
                    System.out.println(filterChain);
                    filterChain.doFilter(request,response);
                    return;
                }
            }
            response.sendRedirect(request.getContextPath()+"/nopower.jsp");
        }else{
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
    }

    @Override
    public void destroy() {

    }
}
