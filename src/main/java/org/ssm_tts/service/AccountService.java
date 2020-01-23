package org.ssm_tts.service;

import org.ssm_tts.entity.Account;
import org.ssm_tts.entity.Fee;

import java.util.List;
import java.util.Map;

/**
 * @author xujin
 * @package-name org.ssm_tts.service
 * @createtime 2019-12-16 10:11
 */

public interface AccountService {
    /**
     * 获取账务的分页数据
     * @param page 页码
     * @return 分页信息
     */
    Map<String,Object> getAccountByPage(int page);

    /**
     * 修改账务账号和业务账号的状态
     * @param account 账务对象
     * @return 返回的状态
     */
    boolean modifyAccountFlag(Account account);
    /**
     * 添加账务账号
     * @param account 账务对象
     * @return 返回的状态
     */
    boolean insertAccount(Account account);

    /**
     * 查询账务账号
     * @param account 账务账号对象
     * @return 返回结果
     */
    List<Account> queryAccount(Account account);

    /**
     * 更新账务账号
     * @param account 账务账号对象
     * @return 返回状态
     */
    boolean updateAccount(Account account);

    /**
     * 获取搜索的分页数据
     * @param page 当前页数
     * @param account 账务账号对象
     * @return 分页结果信息
     */
    Map<String,Object> getAccountBySearch(int page,Account account);

}
