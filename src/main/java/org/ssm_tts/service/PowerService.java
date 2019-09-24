package org.ssm_tts.service;

import org.ssm_tts.entity.Power;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.service
 * @createtime 2019-09-13 15:36
 */

public interface PowerService {

    /**
     * 得到全部的权限信息
     * @return  权限集合
     */
    public List<Power> getAllPower();
}
