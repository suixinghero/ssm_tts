package org.ssm_tts.mapper;

import org.ssm_tts.entity.Fee;
import org.ssm_tts.entity.Service;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.mapper
 * @createtime 2019-12-17 15:45
 */

public interface ServiceMapper {
    /**
     * 添加业务账号
     * @param service 业务账号对象
     * @return 添加行数
     */
    int insertService(Service service);

    /**
     * 更新业务账号
     * @param service 业务账号对象
     * @return 更新行数
     */
    int updateService(Service service);

    /**
     * 查询业务账号
     * @param service 业务账号对象
     * @return 查询结果
     */
    List<Service> queryService(Service service);
}
