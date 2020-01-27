package org.ssm_tts.controller;

import com.google.common.base.Charsets;
import com.google.common.hash.Hashing;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.ssm_tts.entity.Admin;
import org.ssm_tts.service.AdminService;
import org.ssm_tts.util.ErrorMsg;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * @author xujin
 * @package-name org.ssm_tts.controller
 * @createtime 2019-09-13 14:39
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @Resource(name = "adminService")
    private AdminService adminService;
    @RequestMapping("/getImage")
    public void getImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        BufferedImage bufferedImage=new BufferedImage(70,30,BufferedImage.TYPE_INT_BGR);
        Graphics graphics=bufferedImage.getGraphics();
        Color color=new Color(220,220,220);
        graphics.setFont(new Font("宋体", Font.BOLD, 20));
        graphics.setColor(color);
        graphics.fillRect(0,0,70,30);
        Random random=new Random();
        StringBuffer stringBuffer=new StringBuffer();
        String string="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
        for(int i=0;i<4;i++){
            char c=string.charAt(random.nextInt(string.length()));
            stringBuffer.append(c);
            graphics.setColor(new Color(random.nextInt(256),random.nextInt(256),random.nextInt(256)));
            graphics.drawString(c+"",i*12+12,21);
        }
        request.getSession().setAttribute("checkcode",stringBuffer.toString());
        ImageIO.write(bufferedImage,"png",response.getOutputStream());
    }
    @RequestMapping("/loginIndex")
    public String index() throws IOException {
       return "index";
    }
    @RequestMapping("/goIndex")
    public String goIndex(HttpServletRequest request, Admin admin, String checkcode) {
        String md5 = Hashing.md5().hashString(admin.getApassword(), Charsets.UTF_8).toString();
        Admin admin1 = adminService.checkLogin(new Admin(admin.getAuname(), md5));
        String codeBySession = (String) request.getSession().getAttribute("checkcode");
        if (admin1 != null) {
            if (codeBySession.equalsIgnoreCase(checkcode)) {
                admin1.setApassword(admin.getApassword());
                request.getSession().setAttribute("admin1", admin1);
                return "redirect:loginIndex";
            } else {
                request.getSession().setAttribute("checkcode_f_msg", ErrorMsg.CHECKCODE_F_MSG);
                return "redirect:../login.jsp";
            }
        } else {
            request.getSession().setAttribute("login_f_msg", ErrorMsg.LOGIN_F_MSG);
            return "redirect:../login.jsp";

        }


    }

    @RequestMapping("/exit")
    public String exit(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:../login.jsp";
    }
}
