package org.ssm_tts.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.ssm_tts.entity.Admin;
import org.ssm_tts.entity.Fee;
import org.ssm_tts.mapper.FeeMapper;
import org.ssm_tts.service.FeeService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.service.impl
 * @createtime 2019-12-11 16:52
 */
@Service("feeService")
public class FeeServiceImpl implements FeeService {
    @Resource(name = "feeMapper")
    private FeeMapper feeMapper;
    @Override
    public Map<String, Object> getFeeByPage(int page) {
        PageHelper.startPage(page,Fee.PAGE_SIZE);
        List<Fee> fees = feeMapper.queryFee(new Fee());
        PageInfo<Fee> pageInfo=new PageInfo<>(fees);
        Map<String, Object> map=new HashMap<>();
        map.put("fees",fees);
        map.put("pages",pageInfo.getPages());
        return  map;
    }

    @Override
    public boolean insertFee(Fee fee) {
        return feeMapper.insertFee(fee)>0?true:false;
    }

    @Override
    public List<Fee> queryFee(Fee fee) {
        return feeMapper.queryFee(fee);
    }

    @Override
    public boolean updateFee(Fee fee) {
        return feeMapper.updateFee(fee)>0?true:false;
    }

    @Override
    public Map<String, Object> getFeeBySort(int page, int flag) {
        Fee fee=new Fee();
        fee.setSortFlag(flag);
        PageHelper.startPage(page,Fee.PAGE_SIZE);
        List<Fee> fees = feeMapper.queryFee(fee);
        PageInfo<Fee> pageInfo=new PageInfo<>(fees);
        Map<String, Object> map=new HashMap<>();
        map.put("fees",fees);
        map.put("pages",pageInfo.getPages());
        return  map;
    }

}
