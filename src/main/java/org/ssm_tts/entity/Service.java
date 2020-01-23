package org.ssm_tts.entity;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @createtime 2019-12-17 15:46
 *
 * 业务账号
 */

public class Service {
    public static final Integer PAGE_SIZE=8;
    private Integer s_id;      //业务id
    private Integer acc_id;    //账务id
    private String s_id_card;  //身份证号
    private String s_name;     //用户姓名
    private String s_os;       //用户的OS账号
    private Integer s_status;  //业务状态：0：暂停、1：开通、2：删除
    private String s_ip;       //登录服务器的ip
    private String s_pass;     //用户的密码
    private String extinfo1;   //扩展字段1
    private Integer extinfo2;  //扩展字段2
    private String extinfo3;   //扩展字段3
    private String createtime; //创建日期
    private Integer f_id;      //资费id
    private Fee fee;           //资费对象
    private Integer bd_id;     //业务账号账单对象id
    private BD bd;             //业务账号账单对象

    @Override
    public String toString() {
        return "Service{" +
                "s_id=" + s_id +
                ", acc_id=" + acc_id +
                ", s_id_card='" + s_id_card + '\'' +
                ", s_name='" + s_name + '\'' +
                ", s_os='" + s_os + '\'' +
                ", s_status=" + s_status +
                ", s_ip='" + s_ip + '\'' +
                ", s_pass='" + s_pass + '\'' +
                ", extinfo1='" + extinfo1 + '\'' +
                ", extinfo2=" + extinfo2 +
                ", extinfo3='" + extinfo3 + '\'' +
                ", createtime='" + createtime + '\'' +
                ", f_id=" + f_id +
                ", fee=" + fee +
                ", bd_id=" + bd_id +
                ", bd=" + bd +
                '}';
    }

    public Integer getBd_id() {
        return bd_id;
    }

    public void setBd_id(Integer bd_id) {
        this.bd_id = bd_id;
    }

    public BD getBd() {
        return bd;
    }

    public void setBd(BD bd) {
        this.bd = bd;
    }

    public Integer getF_id() {
        return f_id;
    }

    public void setF_id(Integer f_id) {
        this.f_id = f_id;
    }

    public Fee getFee() {
        return fee;
    }

    public void setFee(Fee fee) {
        this.fee = fee;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public static Integer getPageSize() {
        return PAGE_SIZE;
    }

    public Integer getS_id() {
        return s_id;
    }

    public void setS_id(Integer s_id) {
        this.s_id = s_id;
    }

    public Integer getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(Integer acc_id) {
        this.acc_id = acc_id;
    }

    public String getS_id_card() {
        return s_id_card;
    }

    public void setS_id_card(String s_id_card) {
        this.s_id_card = s_id_card;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getS_os() {
        return s_os;
    }

    public void setS_os(String s_os) {
        this.s_os = s_os;
    }

    public Integer getS_status() {
        return s_status;
    }

    public void setS_status(Integer s_status) {
        this.s_status = s_status;
    }

    public String getS_ip() {
        return s_ip;
    }

    public void setS_ip(String s_ip) {
        this.s_ip = s_ip;
    }

    public String getS_pass() {
        return s_pass;
    }

    public void setS_pass(String s_pass) {
        this.s_pass = s_pass;
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
