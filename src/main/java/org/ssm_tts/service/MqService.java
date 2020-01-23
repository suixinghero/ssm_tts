package org.ssm_tts.service;

/**
 * @author xujin
 * @package-name org.ssm_tts.service.impl
 * @createtime 2019-12-18 17:34
 */

public interface MqService {
    /**
     * 修改业务账号资费信息的消息
     * @param service 业务账号对象的json串
     */
    void modifyServiceFee(String service);
}
