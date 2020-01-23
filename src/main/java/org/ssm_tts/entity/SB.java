package org.ssm_tts.entity;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @createtime 2019-12-19 17:34
 *
 * 业务账单详情
 */

public class SB {
    public static final Integer PAGE_SIZE=8;
    private Integer sb_id;           //业务账单详情id
    private Integer bd_id;           //业务账单id
    private String sb_loginin_time;  //用户登入时间
    private String sb_loginout_time; //用户登出时间
    private Long sb_duration;        //消费时长
    private Double sb_cost;          //需交费用
    private Integer f_id;            //资费id
    private String extinfo1;         //扩展字段1
    private Integer extinfo2;        //扩展字段2
    private String extinfo3;         //扩展字段3
    private String sb_ip;            //服务器的ip
    private Fee fee;                 //资费对象

    @Override
    public String toString() {
        return "BS{" +
                "sb_id=" + sb_id +
                ", bd_id=" + bd_id +
                ", sb_loginin_time='" + sb_loginin_time + '\'' +
                ", sb_loginout_time='" + sb_loginout_time + '\'' +
                ", sb_duration=" + sb_duration +
                ", sb_cost=" + sb_cost +
                ", f_id=" + f_id +
                ", extinfo1='" + extinfo1 + '\'' +
                ", extinfo2=" + extinfo2 +
                ", extinfo3='" + extinfo3 + '\'' +
                ", sb_ip='" + sb_ip + '\'' +
                ", fee=" + fee +
                '}';
    }

    public Fee getFee() {
        return fee;
    }

    public void setFee(Fee fee) {
        this.fee = fee;
    }

    public String getSb_ip() {
        return sb_ip;
    }

    public void setSb_ip(String sb_ip) {
        this.sb_ip = sb_ip;
    }

    public static Integer getPageSize() {
        return PAGE_SIZE;
    }

    public Integer getSb_id() {
        return sb_id;
    }

    public void setSb_id(Integer sb_id) {
        this.sb_id = sb_id;
    }

    public Integer getBd_id() {
        return bd_id;
    }

    public void setBd_id(Integer bd_id) {
        this.bd_id = bd_id;
    }

    public String getSb_loginin_time() {
        return sb_loginin_time;
    }

    public void setSb_loginin_time(String sb_loginin_time) {
        this.sb_loginin_time = sb_loginin_time;
    }

    public String getSb_loginout_time() {
        return sb_loginout_time;
    }

    public void setSb_loginout_time(String sb_loginout_time) {
        this.sb_loginout_time = sb_loginout_time;
    }

    public Long getSb_duration() {
        return sb_duration;
    }

    public void setSb_duration(Long sb_duration) {
        this.sb_duration = sb_duration;
    }

    public Double getSb_cost() {
        return sb_cost;
    }

    public void setSb_cost(Double sb_cost) {
        this.sb_cost = sb_cost;
    }

    public Integer getF_id() {
        return f_id;
    }

    public void setF_id(Integer f_id) {
        this.f_id = f_id;
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
