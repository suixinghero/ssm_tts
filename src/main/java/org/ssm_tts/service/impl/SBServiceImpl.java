package org.ssm_tts.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssm_tts.entity.SB;
import org.ssm_tts.mapper.SBMapper;
import org.ssm_tts.service.SBService;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.service.impl
 * @createtime 2019-12-19 19:44
 */
@Service("sbService")
public class SBServiceImpl implements SBService {
    @Autowired
    private SBMapper sbMapper;
    @Override
    public Map<String, Object> getSBByPage(int page,SB sb) {
        PageHelper.startPage(page,SB.PAGE_SIZE);
        List<SB> sbs = sbMapper.querySB(sb);
        PageInfo<SB> pageInfo=new PageInfo<>(sbs);
        Map<String, Object> map=new HashMap<>();
        map.put("sbs",sbs);
        map.put("pages",pageInfo.getPages());
        return  map;
    }
}
