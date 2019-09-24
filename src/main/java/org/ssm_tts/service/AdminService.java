package org.ssm_tts.service;

import org.ssm_tts.entity.AL;
import org.ssm_tts.entity.Admin;
import org.ssm_tts.entity.Role;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.service
 * @createtime 2019-09-13 15:31
 */

public interface AdminService {
    /**
     * 登录判断
     * @param admin 管理员
     * @return 管理员
     */
    public Admin checkLogin(Admin admin);
    /**
     * 更新管理员的密码
     * @param admin 管理员对象
     * @return 影响的行数
     */
    public boolean updatePassword(Admin admin);
    /**
     * 更新管理员的基本信息
     * @param admin 管理员对象
     * @return 是否更新成功
     */
    public boolean updateAdmin(Admin admin);
    /**
     * 分页查询管理员的信息
     * @param page 页数
     * @return 管理员的集合
     */
    public List<Admin> getAdminByPage(int page);
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
    public boolean insertAdmin(Admin admin,String[] adminList);
    /**
     * 根据管理员id得到角色id的集合
     * @param aid 管理员id
     * @return 角色id的集合
     */
    public List<Integer> getRidByAid(int aid);
    /**
     * 在管理员修改页面更新管理员
     * @param admin 管理员对象
     * @param ridList 角色id的集合
     * @return 是否成功更新
     */
    public boolean updateAdminByAdmin(Admin admin, String[] ridList);
    /**
     * 删除管理员
     * @param aid 管理员id
     * @return
     */
    public boolean deleteAdmin(Integer aid);
    /**
     * 重置密码
     * @param al 拥有重置者名字和管理员id的对象
     * @return
     */
    public boolean resetPwd(AL al);
    /**
     * 查询获得管理员的集合
     * @param
     * @return
     */
    public List<Admin> getAdminByFind(int page,String rname);
}
