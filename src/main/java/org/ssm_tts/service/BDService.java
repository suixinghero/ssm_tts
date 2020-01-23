package org.ssm_tts.service;

import org.ssm_tts.entity.BD;
import org.ssm_tts.entity.Fee;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.service
 * @createtime 2019-12-19 20:22
 */

public interface BDService {
    /**
     * 查询业务账单
     * @param bd 业务账单对象
     * @return 业务账单对象集合
     */
    List<BD> queryBD(BD bd);
}
