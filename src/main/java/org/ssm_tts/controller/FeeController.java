package org.ssm_tts.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ssm_tts.entity.Fee;
import org.ssm_tts.entity.Result;
import org.ssm_tts.service.FeeService;
import org.ssm_tts.util.ErrorMsg;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.util.List;
import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.controller
 * @createtime 2019-12-11 16:39
 */

@Controller
@RequestMapping("/fee")
public class FeeController {
    @Resource(name = "feeService")
    private FeeService feeService;

    @RequestMapping("/feeList/{page}")
    public String feeList(@PathVariable(value = "page") String page, HttpServletRequest request) {
        int currentPage = Integer.parseInt(page);
        Map<String, Object> map = feeService.getFeeByPage(currentPage);
        int pages = (int) map.get("pages");
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= pages; i++) {
            if (currentPage == i) {
                sb.append("[" + i + "]");
            } else {
                sb.append("<a href='" + request.getContextPath() + "/fee/feeList/" + i + "'>" + i + "</a>");
            }
            sb.append(" ");
        }
        request.getSession().setAttribute("feeList", map.get("fees"));
        request.getSession().setAttribute("bar", sb.toString());
        return "redirect:../go_fee_list";
    }

    @RequestMapping("/go_fee_list")
    public String go_fee_list() {
        return "fee/fee_list";
    }

    @RequestMapping("/feeAdd")
    public String feeAdd() {
        return "redirect:go_fee_add";
    }

    @RequestMapping("/go_fee_add")
    public String go_fee_add() {
        return "fee/fee_add";
    }

    @RequestMapping("/feeSave")
    public String feeSave(Fee fee, HttpServletRequest request) {
        boolean flag = feeService.insertFee(fee);
        if (flag) {
            request.getSession().setAttribute("insert_fee_s_msg", ErrorMsg.INSERT_FEE_S_MSG);
            return "redirect:feeAdd";
        }
        request.getSession().setAttribute("insert_fee_f_msg", ErrorMsg.INSERT_FEE_F_MSG);
        return "redirect:feeAdd";
    }

    @RequestMapping("/isExists")
    @ResponseBody
    public Result isExists(String ac_name) {
        Fee fee=new Fee();
        fee.setAc_name(ac_name);
        List<Fee> fees = feeService.queryFee(fee);
        if(fees.size()==0){
            return new Result(ErrorMsg.ResponseCode.SUCCESS,ErrorMsg.ResponseMsg.SUCCESS);
        }
        return new Result(ErrorMsg.ResponseCode.NAME_ALREADY_EXISTS,ErrorMsg.ResponseMsg.NAME_ALREADY_EXISTS);
    }

    @RequestMapping("/feeShow/{id}")
    public String feeShow(@PathVariable(name = "id") String id,HttpServletRequest request) {
        Fee fee=new Fee();
        fee.setId(Integer.parseInt(id));
        List<Fee> fees = feeService.queryFee(fee);
        request.getSession().setAttribute("fee",fees.get(0));
        return "redirect:../go_fee_detail";
    }

    @RequestMapping("/go_fee_detail")
    public String go_fee_detail() {
        return "fee/fee_detail";
    }

    @RequestMapping("/feeModi/{id}")
    public String feeModi(@PathVariable(name = "id")Integer id,HttpServletRequest request) {
        Fee fee=new Fee();
        fee.setId(id);
        List<Fee> fees = feeService.queryFee(fee);
        request.getSession().setAttribute("fee",fees.get(0));
        return "redirect:../go_fee_modi";
    }

    @RequestMapping("/go_fee_modi")
    public String go_fee_modi() {
        return "fee/fee_modi";
    }

    @RequestMapping("/feeStart/{id}")
    public String feeUpdate(@PathVariable(value = "id")String id,HttpServletRequest request) {
        Fee fee=new Fee();
        fee.setId(Integer.parseInt(id));
        fee.setStarttime("starttime");
        fee.setAc_status(1);
        boolean flag = feeService.updateFee(fee);
        if(flag){
            request.getSession().setAttribute("start_fee_s_msg",ErrorMsg.START_FEE_S_MSG);
            return "redirect:../feeList/1";
        }
        request.getSession().setAttribute("start_fee_f_msg",ErrorMsg.START_FEE_F_MSG);
        return "redirect:../feeList/1";
    }

    @RequestMapping("/feeDelete/{id}")
    public String feeDelete(@PathVariable(name = "id")String id,HttpServletRequest request) {
        Fee fee = new Fee();
        fee.setId(Integer.parseInt(id));
        fee.setAc_status(2);
        boolean flag = feeService.updateFee(fee);
        if (flag) {
            request.getSession().setAttribute("delete_fee_s_msg", ErrorMsg.DELETE_FEE_S_MSG);
            return "redirect:../feeList/1";
        }
        request.getSession().setAttribute("delete_fee_f_msg", ErrorMsg.DELETE_FEE_F_MSG);
        return "redirect:../feeList/1";

    }

    @RequestMapping("/feeSort/{page}/{flag}")
    public String feeSort(@PathVariable(name="page")Integer currentPage,@PathVariable(name = "flag")Integer flag,
                           HttpServletRequest request) {
        Map<String, Object> map = feeService.getFeeBySort(currentPage,flag);
        int pages = (int) map.get("pages");
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= pages; i++) {
            if (currentPage == i) {
                sb.append("[" + i + "]");
            } else {
                sb.append("<a href='" + request.getContextPath() + "/fee/feeSort/" + i + "/"+flag+"'>" + i + "</a>");
            }
            sb.append(" ");
        }
        request.getSession().setAttribute("feeList", map.get("fees"));
        request.getSession().setAttribute("bar", sb.toString());
        return "redirect:../../go_fee_list";
    }

    @RequestMapping("/feeUpdate")
    public String feeUpdate(Fee fee,HttpServletRequest request) {
        boolean flag = feeService.updateFee(fee);
        if(flag){
            request.getSession().setAttribute("update_fee_s_msg", ErrorMsg.UPDATE_FEE_S_MSG);
            return "redirect:feeList/1";
        }
        request.getSession().setAttribute("update_fee_f_msg", ErrorMsg.UPDATE_FEE_F_MSG);
        return "redirect:feeList/1";
    }
}
