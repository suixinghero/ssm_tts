package org.ssm_tts.controller;

import com.google.common.base.Charsets;
import com.google.common.hash.Hashing;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ssm_tts.entity.Account;
import org.ssm_tts.entity.Fee;
import org.ssm_tts.entity.Result;
import org.ssm_tts.entity.Service;
import org.ssm_tts.service.AccountService;
import org.ssm_tts.service.FeeService;
import org.ssm_tts.service.MqService;
import org.ssm_tts.service.ServiceService;
import org.ssm_tts.util.ErrorMsg;
import org.ssm_tts.util.JsonUtils;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.management.JMException;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.controller
 * @createtime 2019-12-17 18:43
 */
@Controller
@RequestMapping("/service")
public class ServiceController {
    @Resource(name="serviceService")
    private ServiceService serviceService;
    @Resource(name="accountService")
    private AccountService accountService;
    @Resource(name = "feeService")
    private FeeService feeService;
    @Resource(name = "mqService")
    private MqService mqService;
    @RequestMapping("/serviceList/{page}")
    public String serviceList(@PathVariable(value = "page") Integer currentPage, HttpServletRequest request) {
        Map<String, Object> map = serviceService.getServiceByPage(currentPage);
        int pages = (int) map.get("pages");
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= pages; i++) {
            if (currentPage == i) {
                sb.append("[" + i + "]");
            } else {
                sb.append("<a href='" + request.getContextPath() + "/service/serviceList/" + i + "'>" + i + "</a>");
            }
            sb.append(" ");
        }
        request.getSession().setAttribute("serviceList", map.get("services"));
        request.getSession().setAttribute("bar", sb.toString());
        return "redirect:../go_service_list";
    }

    @RequestMapping("/go_service_list")
    public String go_service_list() {
        return "service/service_list";
    }

    @RequestMapping("/modifyServiceStatus")
    public String modifyServiceStatus(Service service,HttpServletRequest request) {
        Account account = new Account();
        account.setAcc_id(service.getAcc_id());
        List<Account> accounts = accountService.queryAccount(account);
        account=accounts.get(0);
        if(account.getAcc_status() == 1){
            boolean flag = serviceService.updateService(service);
            if(flag){
                request.getSession().setAttribute("modify_service_status_s_msg",ErrorMsg.MODIFY_SERVICE_STATUS_S_MSG);
                return "redirect:serviceList/1";
            }
            request.getSession().setAttribute("modify_service_status_f_msg",ErrorMsg.MODIFY_SERVICE_STATUS_F_MSG);
            return "redirect:serviceList/1";
        }
        request.getSession().setAttribute("account_status_not_start",ErrorMsg.ACCOUNT_STATUS_NOT_START);
        return "redirect:serviceList/1";
    }

    @RequestMapping("/serviceAdd")
    public String feeAdd(HttpServletRequest request) {
        List<Fee> fees = feeService.queryFee(new Fee());
        request.getSession().setAttribute("feeList",fees);
        return "redirect:go_service_add";
    }

    @RequestMapping("/go_service_add")
    public String go_fee_add() {
        return "service/service_add";
    }


    @RequestMapping("/serviceIsExists")
    @ResponseBody
    public Result serviceIsExists(Account account) {
        List<Account> accounts = accountService.queryAccount(account);
        if(accounts.size()>0) {
            account = accountService.queryAccount(account).get(0);
            Result<Account> result = new Result<>(ErrorMsg.ResponseCode.SUCCESS,ErrorMsg.ResponseMsg.SUCCESS,account);
            return result;
        }
        return new Result(ErrorMsg.ResponseCode.NOT_ACCOUNT_ERROR,ErrorMsg.ResponseMsg.NOT_ACCOUNT_ERROR);
    }

    @RequestMapping("/serviceSave")
    public String serviceSave(Service service, HttpServletRequest request) {
        String md5 = Hashing.md5().hashString(service.getS_pass(), Charsets.UTF_8).toString();
        service.setS_pass(md5);
        boolean flag = serviceService.insertService(service);
        if (flag) {
            request.getSession().setAttribute("insert_service_s_msg", ErrorMsg.INSERT_SERVICE_S_MSG);
            return "redirect:serviceAdd";
        }
        request.getSession().setAttribute("insert_service_f_msg", ErrorMsg.INSERT_SERVICE_F_MSG);
        return "redirect:serviceAdd";
    }

    @RequestMapping("/serviceShow/{id}")
    public String serviceShow(@PathVariable(name = "id") Integer id, HttpServletRequest request) {
        Service service = new Service();
        service.setS_id(id);
        List<Service> services = serviceService.queryService(service);
        request.getSession().setAttribute("service", services.get(0));
        return "redirect:../go_service_detail";
    }
    @RequestMapping("/go_service_detail")
    public String go_service_detail() {
        return "service/service_detail";
    }

    @RequestMapping("/serviceModi/{id}")
    public String serviceModi(@PathVariable(name = "id") Integer id, HttpServletRequest request) {
        Service service = new Service();
        service.setS_id(id);
        List<Service> services = serviceService.queryService(service);
        List<Fee> fees = feeService.queryFee(new Fee());
        request.getSession().setAttribute("service", services.get(0));
        request.getSession().setAttribute("feeList",fees);
        return "redirect:../go_service_modi";
    }

    @RequestMapping("/go_service_modi")
    public String go_service_modi() {
        return "service/service_modi";
    }

    @RequestMapping("/serviceUpdate")
    public String serviceUpdate(Service service,HttpServletRequest request) {
        try {
            mqService.modifyServiceFee(JsonUtils.objectToJson(service));
            request.getSession().setAttribute("update_service_s_msg", ErrorMsg.UPDATE_SERVICE_S_MSG);
            return "redirect:serviceList/1";
        }catch (Exception e){
            request.getSession().setAttribute("update_service_f_msg", ErrorMsg.UPDATE_SERVICE_F_MSG);
            return "redirect:serviceList/1";
        }
    }


    @RequestMapping("/serviceSearch/{page}")
    public String serviceSearch(@PathVariable("page")Integer currentPage,Service service,HttpServletRequest request) {
        Map<String, Object> map = serviceService.getServiceByPage(currentPage,service);
        int pages = (int) map.get("pages");
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= pages; i++) {
            if (currentPage == i) {
                sb.append("[" + i + "]");
            } else {
                sb.append("<a href='" + request.getContextPath() + "/service/serviceSearch/" + i +
                        "?s_id_card="+service.getS_id_card()+"&s_os="+service.getS_os()+
                        "&s_ip="+service.getS_ip()+"&s_status="+service.getS_status()+
                        "'>" + i + "</a>");
            }
            sb.append(" ");
        }
        request.getSession().setAttribute("serviceList", map.get("services"));
        request.getSession().setAttribute("bar", sb.toString());
        return "redirect:../go_service_list";
    }
}
