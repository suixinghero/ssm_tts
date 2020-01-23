package org.ssm_tts.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.ssm_tts.entity.Account;
import org.ssm_tts.entity.Report;
import org.ssm_tts.mapper.ReportMapper;
import org.ssm_tts.service.ReportService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.service.impl
 * @createtime 2019-12-20 11:45
 */
@Service("reportService")
public class ReportServiceImpl implements ReportService {
    @Resource(name = "reportMapper")
    private ReportMapper reportMapper;
    @Override
    public Map<String,Object> getReportByPage(int page, Report report) {
        PageHelper.startPage(page,Report.PAGE_SIZE);
        List<Report> reports = reportMapper.queryReport(report);
        PageInfo<Report> pageInfo=new PageInfo<>(reports);
        Map<String, Object> map=new HashMap<>();
        map.put("reports",reports);
        map.put("pages",pageInfo.getPages());
        return  map;
    }
}
