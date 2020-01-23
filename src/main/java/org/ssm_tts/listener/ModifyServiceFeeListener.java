package org.ssm_tts.listener;

import org.ssm_tts.entity.Service;
import org.ssm_tts.mapper.ServiceMapper;
import org.ssm_tts.util.JsonUtils;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

/**
 * @author xujin
 * @package-name org.ssm_tts.listener
 * @createtime 2019-12-18 18:02
 */

public class ModifyServiceFeeListener implements MessageListener {
    @Resource(name = "serviceMapper")
    private ServiceMapper serviceMapper;
    @Override
    public void onMessage(Message message) {
        TextMessage textMessage= (TextMessage) message;
        try {
            Service service=JsonUtils.jsonToPojo(textMessage.getText(),Service.class);
            serviceMapper.updateService(service);
        } catch (JMSException e) {
            e.printStackTrace();
        }
    }
}
