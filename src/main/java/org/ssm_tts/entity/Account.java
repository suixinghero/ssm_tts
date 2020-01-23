package org.ssm_tts.entity;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @createtime 2019-12-13 17:31
 * 账务管理对象
 */

public class Account {
    public static final Integer PAGE_SIZE=8;
    private Integer acc_id;       //账务账号id
    private String acc_name;      //账务账号所归属用户的姓名
    private String acc_id_card;   //用户的身份证号
    private String login_name;    //登录名
    private Integer acc_status;   //账务账号状态：0：暂停、1：开通、2删除，默认1
    private String createtime;    //创建时间
    private String lasttime;      //上一次登录时间
    private String login_account; //分配给用户的登录账号
    private String acc_pass;      //分配给用户的密码
    private String acc_tel;       //用户的电话
    private String recomm_id_card;//推荐人的身份证号码
    private String acc_birth;     //推荐人的生日
    private String acc_email;     //推荐人的email
    private Integer profession;   //推荐人的职业：0：干部、1：学生、2：技术人员、3：其它
    private Integer acc_sex;      //推荐人性别：0：男、1.女
    private String acc_address;   //推荐人的通信地址
    private String acc_code;      //推荐人的邮编
    private String acc_qq;        //推荐人的qq
    private String extinfo1;      //扩展字段1
    private Integer extinfo2;     //扩展字段2
    private String extinfo3;      //扩展字段3
    private String last_login_ip; //最后一次登录的ip
    private Integer b_id;         //账单id
    private Bill bill;            //账单对象

    @Override
    public String toString() {
        return "Account{" +
                "acc_id=" + acc_id +
                ", acc_name='" + acc_name + '\'' +
                ", acc_id_card='" + acc_id_card + '\'' +
                ", login_name='" + login_name + '\'' +
                ", acc_status=" + acc_status +
                ", createtime='" + createtime + '\'' +
                ", lasttime='" + lasttime + '\'' +
                ", login_account='" + login_account + '\'' +
                ", acc_pass='" + acc_pass + '\'' +
                ", acc_tel='" + acc_tel + '\'' +
                ", recomm_id_card='" + recomm_id_card + '\'' +
                ", acc_birth='" + acc_birth + '\'' +
                ", acc_email='" + acc_email + '\'' +
                ", profession=" + profession +
                ", acc_sex=" + acc_sex +
                ", acc_address='" + acc_address + '\'' +
                ", acc_code='" + acc_code + '\'' +
                ", acc_qq='" + acc_qq + '\'' +
                ", extinfo1='" + extinfo1 + '\'' +
                ", extinfo2=" + extinfo2 +
                ", extinfo3='" + extinfo3 + '\'' +
                ", last_login_ip='" + last_login_ip + '\'' +
                ", b_id=" + b_id +
                ", bill=" + bill +
                '}';
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public Integer getB_id() {
        return b_id;
    }

    public void setB_id(Integer b_id) {
        this.b_id = b_id;
    }

    public String getLast_login_ip() {
        return last_login_ip;
    }

    public void setLast_login_ip(String last_login_ip) {
        this.last_login_ip = last_login_ip;
    }

    public static Integer getPageSize() {
        return PAGE_SIZE;
    }

    public Integer getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(Integer acc_id) {
        this.acc_id = acc_id;
    }

    public String getAcc_name() {
        return acc_name;
    }

    public void setAcc_name(String acc_name) {
        this.acc_name = acc_name;
    }

    public String getAcc_id_card() {
        return acc_id_card;
    }

    public void setAcc_id_card(String acc_id_card) {
        this.acc_id_card = acc_id_card;
    }

    public String getLogin_name() {
        return login_name;
    }

    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }

    public Integer getAcc_status() {
        return acc_status;
    }

    public void setAcc_status(Integer acc_status) {
        this.acc_status = acc_status;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getLasttime() {
        return lasttime;
    }

    public void setLasttime(String lasttime) {
        this.lasttime = lasttime;
    }

    public String getLogin_account() {
        return login_account;
    }

    public void setLogin_account(String login_account) {
        this.login_account = login_account;
    }

    public String getAcc_pass() {
        return acc_pass;
    }

    public void setAcc_pass(String acc_pass) {
        this.acc_pass = acc_pass;
    }

    public String getAcc_tel() {
        return acc_tel;
    }

    public void setAcc_tel(String acc_tel) {
        this.acc_tel = acc_tel;
    }

    public String getRecomm_id_card() {
        return recomm_id_card;
    }

    public void setRecomm_id_card(String recomm_id_card) {
        this.recomm_id_card = recomm_id_card;
    }

    public String getAcc_birth() {
        return acc_birth;
    }

    public void setAcc_birth(String acc_birth) {
        this.acc_birth = acc_birth;
    }

    public String getAcc_email() {
        return acc_email;
    }

    public void setAcc_email(String acc_email) {
        this.acc_email = acc_email;
    }

    public Integer getProfession() {
        return profession;
    }

    public void setProfession(Integer profession) {
        this.profession = profession;
    }

    public Integer getAcc_sex() {
        return acc_sex;
    }

    public void setAcc_sex(Integer acc_sex) {
        this.acc_sex = acc_sex;
    }

    public String getAcc_address() {
        return acc_address;
    }

    public void setAcc_address(String acc_address) {
        this.acc_address = acc_address;
    }

    public String getAcc_code() {
        return acc_code;
    }

    public void setAcc_code(String acc_code) {
        this.acc_code = acc_code;
    }

    public String getAcc_qq() {
        return acc_qq;
    }

    public void setAcc_qq(String acc_qq) {
        this.acc_qq = acc_qq;
    }

    public String getExtinfo1() {
        return extinfo1;
    }

    public void setExtinfo1(String extinfo1) {
        this.extinfo1 = extinfo1;
    }

    public Integer getExtinfo2() {
        return extinfo2;
    }

    public void setExtinfo2(Integer extinfo2) {
        this.extinfo2 = extinfo2;
    }

    public String getExtinfo3() {
        return extinfo3;
    }

    public void setExtinfo3(String extinfo3) {
        this.extinfo3 = extinfo3;
    }
}
