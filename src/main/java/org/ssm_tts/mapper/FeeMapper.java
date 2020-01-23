package org.ssm_tts.mapper;

import org.ssm_tts.entity.Fee;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.mapper
 * @createtime 2019-12-11 14:03
 */

public interface FeeMapper {
    /**
     * 添加资费
     * @param fee 资费对象
     * @return 影响的行数
     */
    int insertFee(Fee fee);

    /**
     * 更新资费
     * @param fee 资费对象
     * @return 影响的行数
     */
    int updateFee(Fee fee);

    /**
     * 查询资费
     * @param fee 资费对象
     * @return 资费对象的集合
     */
    List<Fee> queryFee(Fee fee);

    /**
     * 查询资费
     * @param f_id 资费id
     * @return 资费对象
     */
    Fee queryFeeById(int f_id);
}
