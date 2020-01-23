package org.ssm_tts.controller;

import com.google.common.base.Charsets;
import com.google.common.hash.Hashing;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.ssm_tts.entity.Admin;
import org.ssm_tts.service.AdminService;
import org.ssm_tts.util.ErrorMsg;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;

/**
 * @author xujin
 * @package-name org.ssm_tts.controller
 * @createtime 2019-09-13 17:39
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource(name = "adminService")
    private AdminService adminService;

    @RequestMapping("/go_user_modi_pwd")
    public String go_user_modi_pwd(){
        return "user/user_modi_pwd";
    }

    @RequestMapping("/go_user_info")
    public String go_user_info(){
        return "user/user_info";
    }

    @RequestMapping("/updatePwd")
    public String updatePwd(String first_newPwd, HttpServletRequest request){
        String md5 = Hashing.md5().hashString(first_newPwd, Charsets.UTF_8).toString();
        Admin admin = (Admin) request.getSession().getAttribute("admin1");
        boolean flag = adminService.updatePassword(new Admin(admin.getAid(), admin.getAname(), md5));
        if (flag) {
            admin.setApassword(first_newPwd);
            request.getSession().setAttribute("admin1", admin);
            request.getSession().setAttribute("update_pwd_s_msg", ErrorMsg.UPDATE_PWD_S_MSG);
            return "redirect:go_user_modi_pwd";
        } else {
            request.getSession().setAttribute("update_pwd_f_msg", ErrorMsg.UPDATE_PWD_F_MSG);
            return "redirect:go_user_modi_pwd";
        }
    }

    @RequestMapping("/updateAdmin")
    public String updateAdmin(HttpServletRequest request) throws Exception{
        String path="http://49.234.117.202:8080/fileuploadserver/upload/";
        DiskFileItemFactory diskFileItemFactory=new DiskFileItemFactory();
        ServletFileUpload servletFileUpload=new ServletFileUpload(diskFileItemFactory);
        List<FileItem> fileItemList=servletFileUpload.parseRequest(request);
        Admin admin=new Admin();
        String url=null;
        for (FileItem fileItem : fileItemList) {
            //进行判断，当前fileItem对象是否为上传文件项
            if(fileItem.isFormField()){
               if(fileItem.getFieldName().equals("aname")){
                   admin.setAname(fileItem.getString("utf-8"));
               }else if(fileItem.getFieldName().equals("atel")){
                   admin.setAtel(fileItem.getString("utf-8"));
               }else if(fileItem.getFieldName().equals("aemail")){
                  admin.setAemail(fileItem.getString("utf-8"));
               }
            }else{
                String fileName=fileItem.getName().substring(fileItem.getName().lastIndexOf("\\")+1);
                //把文件的名称设置成唯一值,uuid
                String uuid=UUID.randomUUID().toString().replace("-","");
                //完成文件上传
                fileName=uuid+"_"+fileName;
                //创建客户端对象
                Client client=Client.create();
                url=path+fileName;
                //和图片服务器进行连接
                WebResource webResource=client.resource(url);
                //上传文件
                webResource.put(fileItem.get());
            }
        }
        System.out.println(admin);
        Integer aid= ((Admin) request.getSession().getAttribute("admin1")).getAid();
        String aname=((Admin) request.getSession().getAttribute("admin1")).getAname();
        Admin admin1=((Admin) request.getSession().getAttribute("admin1"));
        System.out.println(new Admin(aid,aname,admin.getAname(),admin.getAtel(),admin.getAemail(),url));
        boolean flag=adminService.updateAdmin(new Admin(aid,aname,admin.getAname(),admin.getAtel(),admin.getAemail(),url));
        if(flag){
            admin1.setAname(admin.getAname());
            admin1.setAtel(admin.getAtel());
            admin1.setAemail(admin.getAemail());
            admin1.setAimage(url);
            request.getSession().setAttribute("admin1",admin1);
            request.getSession().setAttribute("update_admin_s_msg",ErrorMsg.UPDATE_ADMIN_S_MSG);
            return "redirect:go_user_info";
        }else{
            request.getSession().setAttribute("update_admin_f_msg",ErrorMsg.UPDATE_ADMIN_F_MSG);
            return "redirect:go_user_info";
        }

    }
}
