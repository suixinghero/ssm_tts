package org.ssm_tts.mapper;


import org.ssm_tts.entity.Report;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.mapper
 * @createtime 2019-12-20 10:37
 */

public interface ReportMapper {
    /**
     * 查询报表
     * @param report 报表对象
     * @return 查询结果
     */
    List<Report> queryReport(Report report);
}
