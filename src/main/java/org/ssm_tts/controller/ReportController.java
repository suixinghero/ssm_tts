package org.ssm_tts.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.ssm_tts.entity.Report;
import org.ssm_tts.service.ReportService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.controller
 * @createtime 2019-12-20 11:29
 */
@Controller
@RequestMapping("/report")
public class ReportController {
    @Resource(name = "reportService")
    private ReportService reportService;
    @RequestMapping("/reportList/{page}/{sortFlag}")
    public String reportList(@PathVariable(value = "page") Integer currentPage,
                             @PathVariable("sortFlag")Integer sortFlag,
                             HttpServletRequest request) {
        Report report=new Report();
        report.setSortFlag(sortFlag);
        Map<String, Object> map = reportService.getReportByPage(currentPage,report);
        int pages = (int) map.get("pages");
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= pages; i++) {
            if (currentPage == i) {
                sb.append("[" + i + "]");
            } else {
                sb.append("<a href='" + request.getContextPath() + "/report/reportList/" + i + "/"+sortFlag+"'>" + i + "</a>");
            }
            sb.append(" ");
        }
        request.getSession().setAttribute("reportList", map.get("reports"));
        request.getSession().setAttribute("sortFlag", sortFlag);
        request.getSession().setAttribute("bar", sb.toString());
        return "redirect:../../go_report_list";
    }
    @RequestMapping("/go_report_list")
    public String go_report_list() {
        return "report/report_list";
    }
}
