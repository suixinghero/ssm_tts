package org.ssm_tts.service.impl;

import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.ssm_tts.entity.RP;
import org.ssm_tts.entity.Role;
import org.ssm_tts.mapper.AdminMapper;
import org.ssm_tts.mapper.PowerMapper;
import org.ssm_tts.mapper.RoleMapper;
import org.ssm_tts.service.RoleService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.service.impl
 * @createtime 2019-09-14 15:45
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {
    @Resource(name = "adminMapper")
    private AdminMapper adminMapper;
    @Resource(name = "powerMapper")
    private PowerMapper powerMapper;
    @Resource(name = "roleMapper")
    private RoleMapper roleMapper;
    @Override
    public List<Role> getRoleByPage(int page) {
        PageHelper.startPage(page,Role.PAGE_SIZE);
        List<Role> roleList=roleMapper.getRoleByPage();
        for (Role role : roleList) {
            String powerString=powerMapper.getPowerString(role.getRid());
            role.setPowerString(powerString);
        }
        return roleList;
    }

    @Override
    public int getRoleCount() {
        return roleMapper.getRoleCount();
    }

    @Override
    public boolean insertRole(Role role, String[] powerList) {
        int count1 = roleMapper.insertRole(role);
        List<RP> rpList = new ArrayList<>();
        for (String s : powerList) {
            RP rp = new RP(role, Integer.parseInt(s));
            rpList.add(rp);
        }
        int count2 = roleMapper.insertRP(rpList);
        if(count1>0&&count2>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public List<Integer> getPidByRid(int rid) {
        List<Integer> pidList=roleMapper.getPidByRid(rid);
        return pidList;
    }

    @Override
    public boolean updateRole(Role role, String[] powerList) {
        int count1=roleMapper.updateRoleName(role);
        int count2=roleMapper.deleteRP(role);
        List<RP> rpList = new ArrayList<>();
        for (String s : powerList) {
            RP rp = new RP(role, Integer.parseInt(s));
            rpList.add(rp);
        }
        int count3 = roleMapper.insertRP(rpList);
        if(count1>0&&count2>0&&count3>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean deleteRole(Integer rid) {
        return roleMapper.deleteRole(rid)>0?true:false;
    }

    @Override
    public List<Role> getAllRole() {
        return roleMapper.getAllRole();
    }
}
