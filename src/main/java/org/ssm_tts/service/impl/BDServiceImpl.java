package org.ssm_tts.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssm_tts.entity.BD;
import org.ssm_tts.mapper.BDMapper;
import org.ssm_tts.service.BDService;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.service.impl
 * @createtime 2019-12-19 20:22
 */
@Service("bdService")
public class BDServiceImpl implements BDService {
    @Autowired
    private BDMapper bdMapper;
    @Override
    public List<BD> queryBD(BD bd) {
        return bdMapper.queryBD(bd);
    }
}
