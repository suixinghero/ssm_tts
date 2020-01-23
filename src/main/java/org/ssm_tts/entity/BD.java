package org.ssm_tts.entity;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @createtime 2019-12-19 15:33
 * 业务账号账单对象
 */

public class BD {
    public static final Integer PAGE_SIZE=8;
    private Integer bd_id;      //业务账号的账单id
    private Long bd_duration;   //消费的时长
    private String createtime;  //用户业务账号上的花费
    private Double bd_cost;     //创建时间
    private String extinfo1;    //扩展字段1
    private Integer extinfo2;   //扩展字段2
    private String extinfo3;    //扩展字段3

    @Override
    public String toString() {
        return "BD{" +
                "bd_id=" + bd_id +
                ", bd_duration=" + bd_duration +
                ", createtime='" + createtime + '\'' +
                ", bd_cost=" + bd_cost +
                ", extinfo1='" + extinfo1 + '\'' +
                ", extinfo2=" + extinfo2 +
                ", extinfo3='" + extinfo3 + '\'' +
                '}';
    }

    public static Integer getPageSize() {
        return PAGE_SIZE;
    }

    public Integer getBd_id() {
        return bd_id;
    }

    public void setBd_id(Integer bd_id) {
        this.bd_id = bd_id;
    }

    public Long getBd_duration() {
        return bd_duration;
    }

    public void setBd_duration(Long bd_duration) {
        this.bd_duration = bd_duration;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public Double getBd_cost() {
        return bd_cost;
    }

    public void setBd_cost(Double bd_cost) {
        this.bd_cost = bd_cost;
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
