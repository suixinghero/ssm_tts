package org.ssm_tts.service.impl;

import org.springframework.stereotype.Service;
import org.ssm_tts.entity.Power;
import org.ssm_tts.mapper.AdminMapper;
import org.ssm_tts.mapper.PowerMapper;
import org.ssm_tts.mapper.RoleMapper;
import org.ssm_tts.service.PowerService;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.service.impl
 * @createtime 2019-09-14 16:59
 */
@Service("powerService")
public class PowerServiceImpl implements PowerService {
    @Resource(name = "adminMapper")
    private AdminMapper adminMapper;
    @Resource(name = "powerMapper")
    private PowerMapper powerMapper;
    @Resource(name = "roleMapper")
    private RoleMapper roleMapper;
    @Override
    public List<Power> getAllPower() {
        List<Power> powerList=powerMapper.getAllPower();
        return powerList;
    }
}
