package org.ssm_tts.mapper;

import org.ssm_tts.entity.RP;
import org.ssm_tts.entity.Role;

import java.sql.SQLException;
import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.mapper
 * @createtime 2019-09-13 15:55
 */

public interface RoleMapper {
    /**
     * 由管理员id获取管理员所拥有的所有角色字符串
     */
    public String getRoleString(int aid);
    /**
     * 分页查询角色信息
     * @return 角色对象集合
     */
    public List<Role> getRoleByPage();

    /**
     * 查询总共有多少个角色
     * @return 角色数
     */
    public int getRoleCount();

    /**
     * 添加角色
     * @param role 角色对象
     * @return  影响行数
     */
    public int insertRole(Role role) ;
    /**
     * 添加角色，权限关联表
     * @return 影响的行数
     * @throws SQLException
     */
    public int insertRP(List<RP> rpList);
    /**
     * 根据角色id得到权限id的集合
     * @param rid 角色id
     * @return 权限id的集合
     */
    public List<Integer> getPidByRid(int rid);

    /**
     * 根据角色id更新角色姓名
     * @param role  角色id
     * @return
     */
    public int updateRoleName(Role role);

    /**
     * 根据角色id删除角色，权限关联表
     * @param role 角色id
     * @return
     */
    public int deleteRP(Role role);

    /**
     * 根据角色id删除角色
     * @param rid 角色id
     * @return
     */
    public int deleteRole(Integer rid);
    /**
     * 得到所有的角色
     * @return 角色集合
     */
    public List<Role> getAllRole();

    /**
     * 通过角色姓名获得管理员id集合
     * @param rname
     * @return 管理员id集合
     */
    public List<Integer> getAidByRname(String rname);
}
