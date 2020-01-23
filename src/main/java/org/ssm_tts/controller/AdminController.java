package org.ssm_tts.controller;

import com.google.common.base.Charsets;
import com.google.common.hash.Hashing;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.ssm_tts.entity.AL;
import org.ssm_tts.entity.Admin;
import org.ssm_tts.entity.Role;
import org.ssm_tts.service.AdminService;
import org.ssm_tts.service.RoleService;
import org.ssm_tts.util.ErrorMsg;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.controller
 * @createtime 2019-09-17 15:14
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource(name = "adminService")
    private AdminService adminService;
    @Resource(name="roleService")
    private RoleService roleService;


    @RequestMapping("/adminList/{page}")
    public String adminList(@PathVariable(value = "page")String page, HttpServletRequest request){
        int currentPage = Integer.parseInt(page);
        List<Admin> adminList = adminService.getAdminByPage(currentPage);
        int pages = 0;
        int count = adminService.getAdminCount();
        if (count % Admin.PAGE_SIZE == 0) {
            pages = count / Admin.PAGE_SIZE;
        } else {
            pages = count / Admin.PAGE_SIZE + 1;
        }
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= pages; i++) {
            if (currentPage == i) {
                sb.append("[" + i + "]");
            } else {
                sb.append("<a href='" + request.getContextPath() + "/admin/adminList/" + i + "'>" + i + "</a>");
            }
            sb.append(" ");
        }
        List<Role> roleList = roleService.getAllRole();
        request.getSession().setAttribute("roleList", roleList);
        request.getSession().setAttribute("adminList", adminList);
        request.getSession().setAttribute("bar", sb.toString());
        return "redirect:../go_admin_list";
    }

    @RequestMapping("/go_admin_list")
    public String go_admin_list(){
        return "admin/admin_list";
    }

    @RequestMapping("/adminAdd")
    public String adminAdd(HttpServletRequest request){
        List<Role> roleList=roleService.getAllRole();
        request.getSession().setAttribute("roleList",roleList);
        return "redirect:go_admin_add";
    }

    @RequestMapping("/go_admin_add")
    public String go_admin_add(){
        return "admin/admin_add";
    }

    @RequestMapping("/adminSave")
    public String adminSave(Admin admin,String[] role,HttpServletRequest request){
        String md5 = Hashing.md5().hashString(admin.getApassword(), Charsets.UTF_8).toString();
         String createuser=((Admin)request.getSession().getAttribute("admin1")).getAname();
         admin.setApassword(md5);
         admin.setCreateuser(createuser);
        boolean flag=adminService.insertAdmin(admin,role);
        if(flag){
            request.getSession().setAttribute("insert_admin_s_msg",ErrorMsg.INSERT_ADMIN_S_MSG);
            return "redirect:adminAdd";
        }else{
            request.getSession().setAttribute("insert_admin_f_msg",ErrorMsg.INSERT_ADMIN_F_MSG);
            return "redirect:adminAdd";
        }
    }

    @RequestMapping("/adminModi")
    public String adminModi(Admin admin,HttpServletRequest request){
        System.out.println(admin);
        List<Integer> ridList=adminService.getRidByAid(admin.getAid());
        List<Role> roleList=roleService.getAllRole();
        admin.setRidList(ridList);
        request.getSession().setAttribute("roleList",roleList);
        request.getSession().setAttribute("admin2",admin);
       return  "redirect:go_admin_modi";
    }

    @RequestMapping("/go_admin_modi")
    public String go_admin_modi(){
        return  "admin/admin_modi";
    }

    @RequestMapping("/updateAdmin")
    public String  updateAdmin(Admin admin,String[] role,HttpServletRequest request){
        Admin admin1= (Admin) request.getSession().getAttribute("admin1");
        boolean flag=adminService.updateAdminByAdmin(
                new Admin(admin.getAid(),admin.getAname(),admin.getAtel(),admin.getAemail(),admin1.getAname()),role);
        if(flag){
            request.getSession().setAttribute("update_admin_s_msg",ErrorMsg.UPDATE_ADMIN_S_MSG);
            return "redirect:adminList/1";
        }else{
            request.getSession().setAttribute("update_admin_f_msg",ErrorMsg.UPDATE_ADMIN_F_MSG);
            return "redirect:adminList/1";
        }
    }

    @RequestMapping("/deleteAdmin")
    public String  deleteAdmin(String aid,HttpServletRequest request){
        boolean flag=adminService.deleteAdmin(Integer.parseInt(aid));
        if(flag){
            request.getSession().setAttribute("delete_admin_s_msg",ErrorMsg.DELETE_ADMIN_S_MSG);
            return "redirect:adminList/1";
        }else{
            request.getSession().setAttribute("delete_admin_f_msg",ErrorMsg.DELETE_ADMIN_F_MSG);
            return "redirect:adminList/1";
        }
    }

    @RequestMapping("/resetAdmin")
    public String  resetPwd(String[] aidList,HttpServletRequest request){
        System.out.println(Arrays.toString(aidList));
        List<Integer> integerList=new ArrayList<>();
        for (String s : aidList) {
            integerList.add(Integer.parseInt(s));
        }
        String updateuser=((Admin)request.getSession().getAttribute("admin1")).getAname();
        AL al=new AL(updateuser,integerList);
        boolean flag=adminService.resetPwd(al);
        if(flag){
            request.getSession().setAttribute("reset_pwd_s_msg",ErrorMsg.RESET_PWD_S_MSG);
            return "redirect:adminList/1";
        }else{
            request.getSession().setAttribute("reset_pwd_f_msg",ErrorMsg.RESET_PWD_F_MSG);
            return "redirect:adminList/1";
        }
    }

    @RequestMapping("/findAdmin/{page}/{rname}")
    public String findAdmin(@PathVariable(value = "page")String page,@PathVariable(value = "rname")String rname,HttpServletRequest request){
        int   currentPage=Integer.parseInt(page);
        List<Admin> adminList=adminService.getAdminByFind(currentPage,rname);
        int pages=0;
        int count=adminService.getAdminCount();
        if(count%Admin.PAGE_SIZE==0){
            pages=count/Admin.PAGE_SIZE;
        }else{
            pages=count/Admin.PAGE_SIZE+1;
        }
        StringBuffer sb=new StringBuffer();
        for (int i = 1; i <=pages; i++) {
            if(currentPage==i){
                sb.append("["+i+"]");
            }else{
                sb.append("<a href='"+request.getContextPath()+"/admin/fingAdmin/"+i+"/"+rname+"'>"+i+"</a>");
            }
            sb.append(" ");
        }
        List<Role> roleList=roleService.getAllRole();
        request.getSession().setAttribute("roleList",roleList);
        request.getSession().setAttribute("adminList",adminList);
        request.getSession().setAttribute("bar",sb.toString());
        return "redirect:../../go_admin_list";
    }
}
