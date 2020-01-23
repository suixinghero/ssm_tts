package org.ssm_tts.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ssm_tts.entity.*;
import org.ssm_tts.service.AccountService;
import org.ssm_tts.service.BDService;
import org.ssm_tts.service.SBService;
import org.ssm_tts.service.ServiceService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.controller
 * @createtime 2019-12-19 14:31
 */
@Controller
@RequestMapping("/bill")
public class BillController {
    @Resource(name = "accountService")
    private AccountService accountService;
    @Resource(name = "serviceService")
    private ServiceService serviceService;
    @Resource(name = "sbService")
    private SBService sbService;
    @Resource(name = "bdService")
    private BDService bdService;
    @RequestMapping("/billList/{page}")
    public String billList(@PathVariable(value = "page") Integer currentPage, HttpServletRequest request) {
        Map<String, Object> map = accountService.getAccountByPage(currentPage);
        int pages = (int) map.get("pages");
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= pages; i++) {
            if (currentPage == i) {
                sb.append("[" + i + "]");
            } else {
                sb.append("<a href='" + request.getContextPath() + "/bill/billList/" + i + "'>" + i + "</a>");
            }
            sb.append(" ");
        }
        request.getSession().setAttribute("accountList", map.get("accounts"));
        request.getSession().setAttribute("bar", sb.toString());
        return "redirect:../go_bill_list";
    }
    @RequestMapping("/go_bill_list")
    public String go_bill_list() {
        return "bill/bill_list";
    }

    @RequestMapping("/billDetail/{page}/{acc_id}")
    public String billDetail(@PathVariable("page")Integer currentPage,@PathVariable("acc_id")Integer acc_id,
                             HttpServletRequest request) {
        Service service=new Service();
        service.setAcc_id(acc_id);
        Account account=new Account();
        account.setAcc_id(acc_id);
        List<Account> accounts = accountService.queryAccount(account);
        Map<String, Object> map = serviceService.getServiceByPage(currentPage,service);
        int pages = (int) map.get("pages");
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= pages; i++) {
            if (currentPage == i) {
                sb.append("[" + i + "]");
            } else {
                sb.append("<a href='" + request.getContextPath() + "/bill/billDetail/" + i + "/"+acc_id+"'>" + i + "</a>");
            }
            sb.append(" ");
        }
        request.getSession().setAttribute("serviceList", map.get("services"));
        request.getSession().setAttribute("account", accounts.get(0));
        request.getSession().setAttribute("bar", sb.toString());
        return "redirect:../../go_bill_item";

    }

    @RequestMapping("/go_bill_item")
    public String go_bill_item() {
        return "bill/bill_item";
    }

    @RequestMapping("/billServiceDetail/{page}/{bd_id}")
    public String billServiceDetail(@PathVariable("page")Integer currentPage,
                                    @PathVariable("bd_id")Integer bd_id,
                                    HttpServletRequest request) {
        BD bd=new BD();
        bd.setBd_id(bd_id);
        List<BD> bds = bdService.queryBD(bd);
        bd=bds.get(0);
        Service service=new Service();
        service.setBd_id(bd_id);
        SB po=new SB();
        po.setBd_id(bd_id);
        List<Service> services = serviceService.queryService(service);
        service=services.get(0);
        Account account=new Account();
        account.setAcc_id(service.getAcc_id());
        List<Account> accounts = accountService.queryAccount(account);
        account=accounts.get(0);
        Map<String, Object> map = sbService.getSBByPage(currentPage,po);
        int pages = (int) map.get("pages");
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= pages; i++) {
            if (currentPage == i) {
                sb.append("[" + i + "]");
            } else {
                sb.append("<a href='" + request.getContextPath() + "/bill/billServiceDetail/" + i + "/"+bd_id+"'>" + i + "</a>");
            }
            sb.append(" ");
        }
        request.getSession().setAttribute("sbList", map.get("sbs"));
        request.getSession().setAttribute("service",service );
        request.getSession().setAttribute("account",account);
        request.getSession().setAttribute("bd",bd);
        request.getSession().setAttribute("bar", sb.toString());
        return "redirect:../../go_bill_service_detail";
    }

    @RequestMapping("/go_bill_service_detail")
    public String go_bill_service_detail() {
        return "bill/bill_service_detail";
    }

    @RequestMapping("/billSearch/{page}")
    public String billSearch(@PathVariable("page")Integer currentPage, Account account, HttpServletRequest request) {
        Map<String, Object> map = accountService.getAccountBySearch(currentPage,account);
        int pages = (int) map.get("pages");
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= pages; i++) {
            if (currentPage == i) {
                sb.append("[" + i + "]");
            } else {
                sb.append("<a href='" + request.getContextPath() + "/bill/billSearch/" + i +
                        "?acc_id_card="+account.getAcc_id_card()+"&acc_name="+account.getAcc_name()+
                        "&login_account="+account.getLogin_account()+
                        "'>" + i + "</a>");
            }
            sb.append(" ");
        }
        request.getSession().setAttribute("accountList", map.get("accounts"));
        request.getSession().setAttribute("bar", sb.toString());
        return "redirect:../go_bill_list";
    }
}
