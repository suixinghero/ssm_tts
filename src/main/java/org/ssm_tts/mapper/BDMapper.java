package org.ssm_tts.mapper;

import org.ssm_tts.entity.BD;
import org.ssm_tts.entity.Bill;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.mapper
 * @createtime 2019-12-19 15:39
 */

public interface BDMapper {
    /**
     * 通过id查询业务账号账单对象
     * @param bd_id 业务账号账单对象id
     * @return 查询结果
     */
    BD queryBDById(int bd_id);

    /**
     * 查询业务账单
     * @param bd 业务账单对象
     * @return 业务账单对象集合
     */
    List<BD> queryBD(BD bd);
}
