package org.ssm_tts.service.impl;

import org.apache.activemq.ScheduledMessage;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;
import org.ssm_tts.service.MqService;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;

/**
 * @author xujin
 * @package-name org.ssm_tts.service.impl
 * @createtime 2019-12-18 17:36
 */
@Service("mqService")
public class MqServiceImpl implements MqService {
    @Resource(name = "jmsTemplate")
    private JmsTemplate jmsTemplate;

    @Override
    public void modifyServiceFee(String service) {
        jmsTemplate.send(new MessageCreator() {
            @Override
            public Message createMessage(Session session) throws JMSException {
                TextMessage textMessage = session.createTextMessage(service);
                textMessage.setLongProperty(ScheduledMessage.AMQ_SCHEDULED_DELAY,1000*60*60*24*30L);
                return  textMessage;
            }
        });
    }
}
