package org.ssm_tts.util;

/**
 * @author xujin
 * @package-name org.ssm_tts.util;
 * @create 2019-08-18 16:39
 */
public class ErrorMsg {
    /**
     * 验证码错误返回的信息
     */
    public static final String CHECKCODE_F_MSG="0";
    /**
     * 登录失败是返回的错误信息
     */
    public static final String LOGIN_F_MSG="1";
    /**
     * 更新密码成功返回的信息
     */
    public static final String UPDATE_PWD_S_MSG="2";
    /**
     * 更新密码失败返回的信息
     */
    public static final String UPDATE_PWD_F_MSG="3";
    /**
     * 更新管理员信息成功返回的信息
     */
    public static final String UPDATE_ADMIN_S_MSG="4";
    /**
     * 更新管理员信息失败返回的信息
     */
    public static final String UPDATE_ADMIN_F_MSG="5";
    /**
     * 添加角色信息成功返回的信息
     */
    public static final String INSERT_ROLE_S_MSG="6";
    /**
     * 添加角色信息失败返回的信息
     */
    public static final String INSERT_ROLE_F_MSG="7";
    /**
     * 删除角色成功返回的信息
     */
    public static final String DELETE_ROLE_S_MSG="8";
    /**
     * 删除角色失败返回的信息
     */
    public static final String DELETE_ROLE_F_MSG="9";
    /**
     * 更新角色成功返回的信息
     */
    public static final String UPDATE_ROLE_S_MSG="10";
    /**
     * 更新角色失败返回的信息
     */
    public static final String UPDATE_ROLE_F_MSG="11";
    /**
     * 增加角色成功返回的信息
     */
    public static final String INSERT_ADMIN_S_MSG="12";
    /**
     * 增加角色失败返回的信息
     */
    public static final String INSERT_ADMIN_F_MSG="13";
    /**
     * 删除管理员成功返回的信息
     */
    public static final String DELETE_ADMIN_S_MSG="14";
    /**
     * 删除管理员失败返回的信息
     */
    public static final String DELETE_ADMIN_F_MSG="15";
    /**
     * 重置密码成功发回的信息
     */
    public static final String RESET_PWD_S_MSG="16";
    /**
     * 重置密码失败发回的信息
     */
    public static final String RESET_PWD_F_MSG="17";
    /**
     * 增加资费成功返回的信息
     */
    public static final String INSERT_FEE_S_MSG="18";
    /**
     * 增加资费失败返回的信息
     */
    public static final String INSERT_FEE_F_MSG="19";
    /**
     * 开通资费成功返回的信息
     */
    public static final String START_FEE_S_MSG="20";
    /**
     * 开通资费失败返回的信息
     */
    public static final String START_FEE_F_MSG="21";
    /**
     * 删除资费成功返回的信息
     */
    public static final String DELETE_FEE_S_MSG="22";
    /**
     * 删除资费失败返回的信息
     */
    public static final String DELETE_FEE_F_MSG="23";
    /**
     * 修改资费成功返回的信息
     */
    public static final String UPDATE_FEE_S_MSG="24";
    /**
     * 修改资费失败返回的信息
     */
    public static final String UPDATE_FEE_F_MSG="25";
    /**
     * 修改账务账号状态成功返回的信息
     */
    public static final String MODIFY_ACCOUNT_STATUS_S_MSG="26";
    /**
     * 修改账务账号状态失败返回的信息
     */
    public static final String MODIFY_ACCOUNT_STATUS_F_MSG="27";
    /**
     * 添加账务账号成功返回的信息
     */
    public static final String INSERT_ACCOUNT_S_MSG="28";
    /**
     * 添加账务账号失败返回的信息
     */
    public static final String INSERT_ACCOUNT_F_MSG="29";
    /**
     * 更新账务账号成功返回的信息
     */
    public static final String UPDATE_ACCOUNT_S_MSG="30";
    /**
     * 更新账务账号失败返回的信息
     */
    public static final String UPDATE_ACCOUNT_F_MSG="31";
    /**
     * 修改业务账号状态成功返回的信息
     */
    public static final String MODIFY_SERVICE_STATUS_S_MSG="32";
    /**
     * 修改业务账号状态失败返回的信息
     */
    public static final String MODIFY_SERVICE_STATUS_F_MSG="33";
    /**
     * 账务账号没有开通返回的信息
     */
    public static final String ACCOUNT_STATUS_NOT_START="34";
    /**
     * 添加业务账号成功
     */
    public static final String INSERT_SERVICE_S_MSG="35";
    /**
     * 添加业务账号失败
     */
    public static final String INSERT_SERVICE_F_MSG="36";
    /**
     * 更新业务账号成功
     */
    public static final String UPDATE_SERVICE_S_MSG="37";
    /**
     * 更新业务账号失败
     */
    public static final String UPDATE_SERVICE_F_MSG="38";

    public static final class ResponseCode{
        public static final String SUCCESS="0000";
        public static final String NAME_ALREADY_EXISTS="0001";
        public static final String OLR_PWD_ERROR="0002";
        public static final String NOT_ACCOUNT_ERROR="0003";
    }

    public static final class ResponseMsg{
        public static final String SUCCESS="成功";
        public static final String NAME_ALREADY_EXISTS="资费名称已存在";
        public static final String OLR_PWD_ERROR="旧密码错误";
        public static final String NOT_ACCOUNT_ERROR="账务账号不存在";
    }
}
