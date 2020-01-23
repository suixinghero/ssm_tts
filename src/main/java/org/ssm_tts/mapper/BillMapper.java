package org.ssm_tts.mapper;

import org.ssm_tts.entity.Bill;

/**
 * @author xujin
 * @package-name org.ssm_tts.mapper
 * @createtime 2019-12-19 14:21
 */

public interface BillMapper {
    /**
     * 通过账单id查询账单
     * @param b_id 账单id
     * @return 查询结果
     */
    Bill queryBillById(int b_id);
}
