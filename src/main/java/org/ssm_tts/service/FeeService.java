package org.ssm_tts.service;

import org.ssm_tts.entity.Fee;

import java.util.List;
import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.service
 * @createtime 2019-12-11 16:52
 */

public interface FeeService {
    /**
     * 获取资费的分页数据
     *
     * @param page 页码
     * @return 分页信息
     */
    Map<String, Object> getFeeByPage(int page);

    /**
     * 添加资费
     *
     * @param fee 资费对象
     * @return 是否插入成功
     */
    boolean insertFee(Fee fee);

    /**
     * 查询资费
     *
     * @param fee 资费对象
     * @return 资费对象的集合
     */
    List<Fee> queryFee(Fee fee);

    /**
     * 更新资费
     *
     * @param fee 资费对象
     * @return 是否更新成功
     */
    boolean updateFee(Fee fee);

    /**
     * 获取排序结果数据
     *
     * @param page 当前页码
     * @param flag 排序表示
     * @return 分页信息
     */
    Map<String, Object> getFeeBySort(int page, int flag);


}