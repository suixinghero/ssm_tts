package org.ssm_tts.service;

import org.ssm_tts.entity.Role;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.service
 * @createtime 2019-09-14 15:43
 */

public interface RoleService {
    /**
     * 分页查询角色信息
     * @return 角色对象集合
     */
    public List<Role> getRoleByPage(int page);
    /**
     * 查询总共有多少个角色
     * @return 角色数
     */
    public int getRoleCount();
    /**
     * 添加角色
     * @param role 角色对象
     * @param  powerList 角色权限id的集合
     * @return  是否成功插入
     */
    public boolean insertRole(Role role,String[] powerList);
    /**
     * 根据角色id得到权限id的集合
     * @param rid 角色id
     * @return 权限id的集合
     */
    public List<Integer> getPidByRid(int rid);
    /**
     * 更新角色
     * @param role 角色对象
     * @param powerList 角色权限id的集合
     * @return 是否成功插入
     */
    public boolean updateRole(Role role,String[] powerList);
    /**
     * 删除角色
     * @param rid 角色id
     * @return 是否删除成功
     */
    public boolean deleteRole(Integer rid) ;
    /**
     * 得到所有的角色
     * @return 角色集合
     */
    public List<Role> getAllRole();
}
