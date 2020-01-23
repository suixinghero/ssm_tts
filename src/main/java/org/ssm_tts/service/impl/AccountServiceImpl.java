package org.ssm_tts.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.ssm_tts.entity.Account;
import org.ssm_tts.entity.Fee;
import org.ssm_tts.mapper.AccountMapper;
import org.ssm_tts.mapper.ServiceMapper;
import org.ssm_tts.service.AccountService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.service.impl
 * @createtime 2019-12-16 10:13
 */
@Service("accountService")
public class AccountServiceImpl implements AccountService {
    @Resource(name = "accountMapper")
    private AccountMapper accountMapper;
    @Resource(name = "serviceMapper")
    private ServiceMapper serviceMapper;
    @Override
    public Map<String, Object> getAccountByPage(int page) {
        PageHelper.startPage(page,Account.PAGE_SIZE);
        List<Account> accounts = accountMapper.queryAccount(new Account());
        PageInfo<Account> pageInfo=new PageInfo<>(accounts);
        Map<String, Object> map=new HashMap<>();
        map.put("accounts",accounts);
        map.put("pages",pageInfo.getPages());
        return  map;
    }

    @Override
    public boolean modifyAccountFlag(Account account) {
        org.ssm_tts.entity.Service service=new org.ssm_tts.entity.Service();
        service.setAcc_id(account.getAcc_id());
        service.setS_status(account.getAcc_status());
        int aCount = accountMapper.updateAccount(account);
        serviceMapper.updateService(service);
        return  aCount>0?true:false;
    }

    @Override
    public boolean insertAccount(Account account) {
        return accountMapper.insertAccount(account)>0?true:false;
    }

    @Override
    public List<Account> queryAccount(Account account) {
        return accountMapper.queryAccount(account);
    }

    @Override
    public boolean updateAccount(Account account) {
        return accountMapper.updateAccount(account)>0?true:false;
    }

    @Override
    public Map<String,Object> getAccountBySearch(int page,Account account) {
        PageHelper.startPage(page,Account.PAGE_SIZE);
        List<Account> accounts = accountMapper.queryAccount(account);
        PageInfo<Account> pageInfo=new PageInfo<>(accounts);
        Map<String, Object> map=new HashMap<>();
        map.put("accounts",accounts);
        map.put("pages",pageInfo.getPages());
        return  map;
    }
}
