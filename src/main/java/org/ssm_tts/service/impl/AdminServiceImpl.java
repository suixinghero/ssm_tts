package org.ssm_tts.service.impl;

import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.ssm_tts.entity.*;
import org.ssm_tts.mapper.AdminMapper;
import org.ssm_tts.mapper.PowerMapper;
import org.ssm_tts.mapper.RoleMapper;
import org.ssm_tts.service.AdminService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.service.impl
 * @createtime 2019-09-13 15:31
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Resource(name = "adminMapper")
    private AdminMapper adminMapper;
    @Resource(name = "powerMapper")
    private PowerMapper powerMapper;
    @Resource(name = "roleMapper")
    private RoleMapper roleMapper;
    @Override
    public Admin checkLogin(Admin admin) {
        Admin admin1=adminMapper.checkLogin(admin);
        if(admin1!=null){
            List<Power> powerList=powerMapper.getPowerByAid(admin1.getAid());
            if(powerList!=null&&powerList.size()>0) {
                String roleString=roleMapper.getRoleString(admin1.getAid());
                admin1.setRoleString(roleString);
                admin1.setPowerList(powerList);
                return admin1;
            }else{
                return admin1;
            }
        }else{
            return admin1;
        }
    }

    @Override
    public boolean updatePassword(Admin admin) {
        return adminMapper.updatePassword(admin)>0?true:false;
    }

    @Override
    public boolean updateAdmin(Admin admin) {
        return adminMapper.updateAdmin(admin)>0?true:false;
    }

    @Override
    public List<Admin> getAdminByPage(int page) {
        PageHelper.startPage(page,Admin.PAGE_SIZE);
        List<Admin> adminList=adminMapper.getAdminByPage();
        if(adminList!=null&&adminList.size()>0){
            for (Admin admin : adminList) {
                String roleString=roleMapper.getRoleString(admin.getAid());
                admin.setRoleString(roleString);
            }
        }
        return  adminList;
    }

    @Override
    public int getAdminCount() {
        return adminMapper.getAdminCount();
    }

    @Override
    public boolean insertAdmin(Admin admin, String[] adminList) {
        int count1 = adminMapper.insertAdmin(admin);
        List<AR> arList = new ArrayList<>();
        for (String s : adminList) {
            AR ar = new AR(admin, Integer.parseInt(s));
            arList.add(ar);
        }
        int count2 = adminMapper.insertAR(arList);
        if(count1>0&&count2>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public List<Integer> getRidByAid(int aid) {
        return adminMapper.getRidByAid(aid);
    }

    @Override
    public boolean updateAdminByAdmin(Admin admin, String[] ridList) {
        int count1=adminMapper.updateAdminByAdmin(admin);
        int count2=adminMapper.deleteAR(admin);
        List<AR> arList = new ArrayList<>();
        for (String s : ridList) {
            AR ar = new AR(admin, Integer.parseInt(s));
            arList.add(ar);
        }
        int count3 = adminMapper.insertAR(arList);
        if(count1>0&&count2>0&&count3>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean deleteAdmin(Integer aid) {
        return adminMapper.deleteAdmin(aid)>0?true:false;
    }

    @Override
    public boolean resetPwd(AL al) {
        return adminMapper.resetPwd(al)>0?true:false;
    }

    @Override
    public List<Admin> getAdminByFind(int page,String rname) {
        List<Admin> adminList=null;
        if(!"全部".equals(rname)) {
            List<Integer> aidList = roleMapper.getAidByRname(rname);
            PageHelper.startPage(page, Admin.PAGE_SIZE);
            adminList = adminMapper.getAdminByFind(aidList);
        }else{
            PageHelper.startPage(page,Admin.PAGE_SIZE);
            adminList=adminMapper.getAdminByPage();
        }
        if(adminList!=null&&adminList.size()>0){
            for (Admin admin : adminList) {
                String roleString=roleMapper.getRoleString(admin.getAid());
                admin.setRoleString(roleString);
            }
        }
        return  adminList;
    }
}
