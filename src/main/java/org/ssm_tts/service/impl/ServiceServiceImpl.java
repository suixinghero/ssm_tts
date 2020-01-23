package org.ssm_tts.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.ssm_tts.entity.Account;
import org.ssm_tts.entity.Fee;
import org.ssm_tts.mapper.FeeMapper;
import org.ssm_tts.mapper.ServiceMapper;
import org.ssm_tts.service.ServiceService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.service.impl
 * @createtime 2019-12-17 18:41
 */
@Service("serviceService")
public class ServiceServiceImpl implements ServiceService {
    @Resource(name="serviceMapper")
    private ServiceMapper serviceMapper;
    @Override
    public Map<String, Object> getServiceByPage(int page) {
        PageHelper.startPage(page, org.ssm_tts.entity.Service.PAGE_SIZE);
        List<org.ssm_tts.entity.Service> services = serviceMapper.queryService(new org.ssm_tts.entity.Service());
        PageInfo<org.ssm_tts.entity.Service> pageInfo=new PageInfo<>(services);
        Map<String, Object> map=new HashMap<>();
        map.put("services",services);
        map.put("pages",pageInfo.getPages());
        return  map;
    }

    @Override
    public boolean updateService(org.ssm_tts.entity.Service service) {
        return serviceMapper.updateService(service)>0?true:false;
    }

    @Override
    public boolean insertService(org.ssm_tts.entity.Service service) {
        return serviceMapper.insertService(service)>0?true:false;
    }

    @Override
    public List<org.ssm_tts.entity.Service> queryService(org.ssm_tts.entity.Service service) {
        return serviceMapper.queryService(service);
    }

    @Override
    public Map<String, Object> getServiceByPage(int page, org.ssm_tts.entity.Service service) {
        PageHelper.startPage(page, org.ssm_tts.entity.Service.PAGE_SIZE);
        List<org.ssm_tts.entity.Service> services = serviceMapper.queryService(service);
        PageInfo<org.ssm_tts.entity.Service> pageInfo=new PageInfo<>(services);
        Map<String, Object> map=new HashMap<>();
        map.put("services",services);
        map.put("pages",pageInfo.getPages());
        return  map;
    }

}
