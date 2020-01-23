package org.ssm_tts.mapper;

import org.ssm_tts.entity.Account;
import org.ssm_tts.entity.Fee;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.mapper
 * @createtime 2019-12-13 17:30
 */

public interface AccountMapper {
    /**
     * 查询账务账号
     * @param account 账务对象
     * @return 查询结果
     */
    List<Account> queryAccount(Account account);

    /**
     * 插入账务账号
     * @param account 账务对象
     * @return 影响行数
     */
    int insertAccount(Account account);

    /**
     * 更新账务账号
     * @param account 账务对象
     * @return 影响行数
     */
    int updateAccount(Account account);

    /**
     * 删除账务账号
     * @param account 账务对象
     * @return 影响的行数
     */
    int deleteAccount(Account account);
}
