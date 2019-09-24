package org.ssm_tts.mapper;

import org.ssm_tts.entity.Power;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.mapper
 * @createtime 2019-09-13 15:34
 */

public interface PowerMapper {
    /**
     * 由管理员id从权限表中得到权限集合
     * @param aid 管理员id
     * @return 权限集合
     */
    public List<Power> getPowerByAid(int aid);
    /**
     * 由角色id获取角色所拥有的所有权限字符串
     */
    public String getPowerString(int rid);

    /**
     * 得到全部的权限信息
     * @return 权限集合
     */
    public List<Power> getAllPower();

}
