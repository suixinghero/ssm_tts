package org.ssm_tts.service;


import org.ssm_tts.entity.Account;
import org.ssm_tts.entity.Service;

import java.util.List;
import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.service
 * @createtime 2019-12-17 18:40
 */

public interface ServiceService {
    /**
     * 获取业务的分页数据
     * @param page 页码
     * @return 分页信息
     */
    Map<String,Object> getServiceByPage(int page);

    /**
     * 更新业务账号
     * @param service 业务账号
     * @return 状态信息
     */
    boolean updateService(Service service);

    /**
     * 添加业务账号
     * @param service 业务账号对象
     * @return 状态信息
     */
    boolean insertService(Service service);

    /**
     * 查询业务账号信息
     * @param service 业务账号对象
     * @return 结果信息
     */
    List<Service> queryService(Service service);

    /**
     * 获取业务的分页数据
     * @param page 页码
     * @param service 业务账号对象
     * @return 分页信息
     */
    Map<String,Object> getServiceByPage(int page,Service service);
}
