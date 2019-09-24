package org.ssm_tts.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.ssm_tts.entity.Admin;
import org.ssm_tts.entity.Power;
import org.ssm_tts.entity.Role;
import org.ssm_tts.service.PowerService;
import org.ssm_tts.service.RoleService;
import org.ssm_tts.service.impl.PowerServiceImpl;
import org.ssm_tts.service.impl.RoleServiceImpl;
import org.ssm_tts.util.ErrorMsg;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.controller
 * @createtime 2019-09-13 17:33
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Resource(name = "roleService")
    private RoleService roleService;
    @Resource(name = "powerService")
    private PowerService powerService;

    @RequestMapping("/roleList/{page}")
    public String  roleList(@PathVariable(value = "page")String page, HttpServletRequest request){
        int  currentPage=Integer.parseInt(page);
        List<Role> roleList=roleService.getRoleByPage(currentPage);
        int pages=0;
        int count=roleService.getRoleCount();
        if(count%Role.PAGE_SIZE==0){
            pages=count/Role.PAGE_SIZE;
        }else{
            pages=count/Role.PAGE_SIZE+1;
        }
        StringBuffer sb=new StringBuffer();
        for (int i = 1; i <=pages; i++) {
            if(currentPage==i){
                sb.append("["+i+"]");
            }else{
                sb.append("<a href='"+request.getContextPath()+"/role/roleList/"+i+"'>"+i+"</a>");
            }
            sb.append(" ");
        }
        request.getSession().setAttribute("roleList",roleList);
        request.getSession().setAttribute("bar",sb.toString());
        return "redirect:../go_role_list";
    }

    @RequestMapping("/go_role_list")
    public String  go_role_list(){
        return "role/role_list";
    }

    @RequestMapping("/roleAdd")
    public String  roleAdd(HttpServletRequest request){
        List<Power> powerList=powerService.getAllPower();
        request.getSession().setAttribute("powerList",powerList);
        return "redirect:go_role_add";
    }

    @RequestMapping("/go_role_add")
    public String  go_role_add(){
        return "role/role_add";
    }

    @RequestMapping("/roleSave")
    public String  roleSave(String roleName,String[] power,HttpServletRequest request){
        Admin admin= (Admin) request.getSession().getAttribute("admin1");
        boolean flag=roleService.insertRole(new Role(roleName,admin.getAname()),power);
        if(flag){
            request.getSession().setAttribute("insert_role_s_msg",ErrorMsg.INSERT_ROLE_S_MSG);
            return "redirect:roleAdd";
        }else{
            request.getSession().setAttribute("insert_role_f_msg",ErrorMsg.INSERT_ROLE_F_MSG);
            return "redirect:roleAdd";
        }
    }

    @RequestMapping("/roleModi")
    public String  roleModi(Role role,HttpServletRequest request){
        List<Integer> pidList=roleService.getPidByRid(role.getRid());
        List<Power> powerList=powerService.getAllPower();
        role.setPidList(pidList);
        request.getSession().setAttribute("powerList",powerList);
        request.getSession().setAttribute("role",role);
        return "redirect:go_role_modi";
    }

    @RequestMapping("/go_role_modi")
    public String  go_role_modi(){
        return "role/role_modi";
    }

    @RequestMapping("/updateRole")
    public String  updateRole(Role role,String[] power,HttpServletRequest request){
        Admin admin= (Admin) request.getSession().getAttribute("admin1");
        boolean flag=roleService.updateRole(new Role(role.getRid(),role.getRname(),admin.getAname()),power);
        if(flag){
            request.getSession().setAttribute("update_role_s_msg",ErrorMsg.UPDATE_ROLE_S_MSG);
            return "redirect:roleList/1";
        }else{
            request.getSession().setAttribute("update_role_f_msg",ErrorMsg.UPDATE_ROLE_F_MSG);
            return "redirect:roleList/1";
        }
    }

    @RequestMapping("/deleteRole")
    public String  deleteRole(String rid,HttpServletRequest request){
        boolean flag=roleService.deleteRole(Integer.parseInt(rid));
        if(flag){
            request.getSession().setAttribute("delete_role_s_msg",ErrorMsg.DELETE_ROLE_S_MSG);
            return "redirect:roleList/1";
        }else{
            request.getSession().setAttribute("delete_role_f_msg",ErrorMsg.DELETE_ROLE_F_MSG);
            return "redirect:roleList/1";
        }
    }
}
