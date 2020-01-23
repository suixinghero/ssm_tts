package org.ssm_tts.service;

import org.ssm_tts.entity.SB;

import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.service
 * @createtime 2019-12-19 19:43
 */

public interface SBService {
    /**
     * 得到业务账单详情分页信息
     * @param page 页码
     * @param sb 业务账单详情对象
     * @return 分页信息
     */
   Map<String, Object> getSBByPage(int page, SB sb);
}
