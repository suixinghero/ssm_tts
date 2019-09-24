package org.ssm_tts.mapper;

import org.ssm_tts.entity.AL;
import org.ssm_tts.entity.AR;
import org.ssm_tts.entity.Admin;
import org.ssm_tts.entity.Role;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.mapper
 * @createtime 2019-09-13 14:59
 */

public interface AdminMapper {
    /**
     * 登录判断
     * @param admin 管理员对象
     * @return 管理员
     */
    public Admin checkLogin(Admin admin);
    /**
     * 更新管理员的密码
     * @param admin 管理员对象
     * @return 影响的行数
     */
    public int updatePassword(Admin admin);
    /**
     * 更新管理员的基本信息
     * @param admin 管理员对象
     * @return 影响的行数
     */
    public int updateAdmin(Admin admin);
    /**
     * 分页查询管理员的信息
     * @return 管理员的集合
     */
    public List<Admin> getAdminByPage();
    /**
     * 查询总共有多少个管理员
     * @return 管理员
     */
    public int getAdminCount();

    /**
     * 增加管理员
     * @param admin 管理员对象
     * @return
     */
    public int insertAdmin(Admin admin);

    /**
     * 增加管理员，角色关联表
     * @param arList AR集合
     * @return
     */
    public int insertAR(List<AR> arList);
    /**
     * 根据管理员id得到角色id的集合
     * @param aid 管理员id
     * @return 角色id的集合
     */
    public List<Integer> getRidByAid(int aid);
    /**
     * 在管理员修改页面更新管理员
     * @param admin 管理员对象
     * @return 是否成功更新
     */
    public int updateAdminByAdmin(Admin admin);

    /**
     * 根据管理员id删除管理员，角色关联表
     * @param admin  管理员对象
     * @return
     */
    public int deleteAR(Admin admin);

    /**
     * 删除管理员
     * @param aid 管理员id
     * @return
     */
    public int deleteAdmin(Integer aid);

    /**
     * 重置密码
     * @param al 拥有重置者名字和管理员id的对象
     * @return
     */
    public int resetPwd(AL al);

    /**
     * 通过aid获得管理员的集合
     * @param aidList
     * @return
     */
    public List<Admin> getAdminByFind(List<Integer> aidList);

}
