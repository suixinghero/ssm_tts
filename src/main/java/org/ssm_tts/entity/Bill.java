package org.ssm_tts.entity;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @createtime 2019-12-19 14:03
 */

public class Bill {
    public static final Integer PAGE_SIZE=8;
    private Integer b_id;         //账单id
    private Double b_cost;       //用户费用
    private Integer b_pay_type;  //用户的支付方式：0：支付宝、1：微信、2：银联
    private Integer b_status;    //支付状态：0：未支付、1：已支付，默认0，未支付
    private String createtime;   //创建时间
    private String extinfo1;     //扩展字段1
    private Integer extinfo2;    //扩展字段2
    private String extinfo3;     //扩展字段3

    @Override
    public String toString() {
        return "Bill{" +
                "b_id=" + b_id +
                ", b_cost=" + b_cost +
                ", b_pay_type=" + b_pay_type +
                ", b_status=" + b_status +
                ", createtime='" + createtime + '\'' +
                ", extinfo1='" + extinfo1 + '\'' +
                ", extinfo2=" + extinfo2 +
                ", extinfo3='" + extinfo3 + '\'' +
                '}';
    }

    public static Integer getPageSize() {
        return PAGE_SIZE;
    }

    public Integer getB_id() {
        return b_id;
    }

    public void setB_id(Integer b_id) {
        this.b_id = b_id;
    }

    public Double getB_cost() {
        return b_cost;
    }

    public void setB_cost(Double b_cost) {
        this.b_cost = b_cost;
    }

    public Integer getB_pay_type() {
        return b_pay_type;
    }

    public void setB_pay_type(Integer b_pay_type) {
        this.b_pay_type = b_pay_type;
    }

    public Integer getB_status() {
        return b_status;
    }

    public void setB_status(Integer b_status) {
        this.b_status = b_status;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
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
