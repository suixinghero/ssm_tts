package org.ssm_tts.service;

import org.ssm_tts.entity.Account;
import org.ssm_tts.entity.Report;

import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.service
 * @createtime 2019-12-20 11:44
 */

public interface ReportService {
    /**
     * 得到报表的分页结果
     * @param page 页码
     * @param report 报表对象
     * @return 分页信息
     */
    Map<String,Object> getReportByPage(int page, Report report);
}
