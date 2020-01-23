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
import org.ssm_tts.service.ServiceService;
import org.ssm_tts.util.ErrorMsg;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.controller
 * @createtime 2019-12-13 19:56
 */
@Controller
@RequestMapping("/account")
public class AccountController {
    @Resource(name="accountService")
    private AccountService accountService;

    @RequestMapping("/accountList/{page}")
    public String accountList(@PathVariable(value = "page") String page, HttpServletRequest request) {
        int currentPage = Integer.parseInt(page);
        Map<String, Object> map = accountService.getAccountByPage(currentPage);
        int pages = (int) map.get("pages");
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= pages; i++) {
            if (currentPage == i) {
                sb.append("[" + i + "]");
            } else {
                sb.append("<a href='" + request.getContextPath() + "/account/accountList/" + i + "'>" + i + "</a>");
            }
            sb.append(" ");
        }
        request.getSession().setAttribute("accountList", map.get("accounts"));
        request.getSession().setAttribute("bar", sb.toString());
        return "redirect:../go_account_list";
    }
    @RequestMapping("/go_account_list")
    public String go_account_list() {
        return "account/account_list";
    }

    @RequestMapping("/accountAdd")
    public String feeAdd() {
        return "redirect:go_account_add";
    }

    @RequestMapping("/go_account_add")
    public String go_fee_add() {
        return "account/account_add";
    }

    @RequestMapping("/accountSave")
    public String accountSave(Account account, HttpServletRequest request) {
        String md5 = Hashing.md5().hashString(account.getAcc_pass(), Charsets.UTF_8).toString();
        account.setAcc_pass(md5);
        boolean flag = accountService.insertAccount(account);
        if (flag) {
            request.getSession().setAttribute("insert_account_s_msg", ErrorMsg.INSERT_ACCOUNT_S_MSG);
            return "redirect:accountAdd";
        }
        request.getSession().setAttribute("insert_account_f_msg", ErrorMsg.INSERT_ACCOUNT_F_MSG);
        return "redirect:accountAdd";
    }

    @RequestMapping("/accountShow/{id}")
    public String accountShow(@PathVariable(name = "id") Integer id, HttpServletRequest request) {
        Account account = new Account();
        account.setAcc_id(id);
        List<Account> accounts = accountService.queryAccount(account);
        request.getSession().setAttribute("account", accounts.get(0));
        return "redirect:../go_account_detail";
    }
    @RequestMapping("/go_account_detail")
    public String go_account_detail() {
        return "account/account_detail";
    }

    @RequestMapping("/modifyAccountFlag/{id}/{status}")
    public String modifyAccountFlag(@PathVariable(value = "id")Integer id,@PathVariable(value = "status")Integer status,
                                    HttpServletRequest request) {
        Account account=new Account();
        account.setAcc_id(id);
        account.setAcc_status(status);
        boolean flag = accountService.modifyAccountFlag(account);
        if(flag){
            request.getSession().setAttribute("modify_account_status_s_msg",ErrorMsg.MODIFY_ACCOUNT_STATUS_S_MSG);
            return "redirect:../../accountList/1";
        }
        request.getSession().setAttribute("modify_account_status_f_msg",ErrorMsg.MODIFY_ACCOUNT_STATUS_F_MSG);
        return "redirect:../../accountList/1";
    }

    @RequestMapping("/accountModi/{id}")
    public String accountModi(@PathVariable(name = "id") Integer id, HttpServletRequest request) {
        Account account = new Account();
        account.setAcc_id(id);
        List<Account> accounts = accountService.queryAccount(account);
        request.getSession().setAttribute("account", accounts.get(0));
        return "redirect:../go_account_modi";
    }

    @RequestMapping("/go_account_modi")
    public String go_account_modi() {
        return "account/account_modi";
    }

    @RequestMapping("/oldPwd")
    @ResponseBody
    public Result oldPwd(Account account) {
        String oldPwd = Hashing.md5().hashString(account.getAcc_pass(), Charsets.UTF_8).toString();
        List<Account> accounts = accountService.queryAccount(account);
        String acc_pwd=accounts.get(0).getAcc_pass();
        if(acc_pwd.equals(oldPwd)){
            return new Result(ErrorMsg.ResponseCode.SUCCESS,ErrorMsg.ResponseMsg.SUCCESS);
        }
        return new Result(ErrorMsg.ResponseCode.OLR_PWD_ERROR,ErrorMsg.ResponseMsg.OLR_PWD_ERROR);
    }

    @RequestMapping("/accountUpdate")
    public String accountUpdate(Account account,HttpServletRequest request) {
        String md5 = Hashing.md5().hashString(account.getAcc_pass(), Charsets.UTF_8).toString();
        account.setAcc_pass(md5);
        boolean flag = accountService.updateAccount(account);
        if(flag){
            request.getSession().setAttribute("update_account_s_msg", ErrorMsg.UPDATE_ACCOUNT_S_MSG);
            return "redirect:accountList/1";
        }
        request.getSession().setAttribute("update_account_f_msg", ErrorMsg.UPDATE_ACCOUNT_F_MSG);
        return "redirect:accountList/1";
    }

    @RequestMapping("/accountSearch/{page}")
    public String accountSearch(@PathVariable("page")Integer currentPage,Account account,HttpServletRequest request) {
        Map<String, Object> map = accountService.getAccountBySearch(currentPage,account);
        int pages = (int) map.get("pages");
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= pages; i++) {
            if (currentPage == i) {
                sb.append("[" + i + "]");
            } else {
                sb.append("<a href='" + request.getContextPath() + "/account/accountSearch/" + i +
                          "?acc_id_card="+account.getAcc_id_card()+"&acc_name="+account.getAcc_name()+
                          "&login_account="+account.getLogin_account()+"&acc_status="+account.getAcc_status()+
                           "'>" + i + "</a>");
            }
            sb.append(" ");
        }
        request.getSession().setAttribute("accountList", map.get("accounts"));
        request.getSession().setAttribute("bar", sb.toString());
        return "redirect:../go_account_list";
    }
}
