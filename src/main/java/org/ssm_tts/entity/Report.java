package org.ssm_tts.entity;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @createtime 2019-12-20 10:31
 *
 * 报表
 */

public class Report {
    public static final Integer PAGE_SIZE=8;
    private Integer re_id;            //表id
    private String re_account;        //账务账号
    private String re_id_card;        //身份证号
    private String re_tel;            //电话号码
    private String re_start_time;     //开始日期
    private Long cumulative_duration; //累计时长
    private String extinfo1;          //扩展字段1
    private Integer extinfo2;         //扩展字段2
    private String extinfo3;          //扩展字段3
    private Double re_cost;           //用户花费
    private Integer sortFlag;         //排序标识 1:根据时长排序、2：根据金额排序
    private String re_name;            //用户姓名

    @Override
    public String toString() {
        return "Report{" +
                "re_id=" + re_id +
                ", re_account='" + re_account + '\'' +
                ", re_id_card='" + re_id_card + '\'' +
                ", re_tel='" + re_tel + '\'' +
                ", re_start_time='" + re_start_time + '\'' +
                ", cumulative_duration=" + cumulative_duration +
                ", extinfo1='" + extinfo1 + '\'' +
                ", extinfo2=" + extinfo2 +
                ", extinfo3='" + extinfo3 + '\'' +
                ", re_cost=" + re_cost +
                ", sortFlag=" + sortFlag +
                ", re_name='" + re_name + '\'' +
                '}';
    }

    public String getRe_name() {
        return re_name;
    }

    public void setRe_name(String re_name) {
        this.re_name = re_name;
    }

    public Integer getSortFlag() {
        return sortFlag;
    }

    public void setSortFlag(Integer sortFlag) {
        this.sortFlag = sortFlag;
    }

    public Double getRe_cost() {
        return re_cost;
    }

    public void setRe_cost(Double re_cost) {
        this.re_cost = re_cost;
    }

    public static int getPageSize() {
        return PAGE_SIZE;
    }

    public Integer getRe_id() {
        return re_id;
    }

    public void setRe_id(Integer re_id) {
        this.re_id = re_id;
    }

    public String getRe_account() {
        return re_account;
    }

    public void setRe_account(String re_account) {
        this.re_account = re_account;
    }

    public String getRe_id_card() {
        return re_id_card;
    }

    public void setRe_id_card(String re_id_card) {
        this.re_id_card = re_id_card;
    }

    public String getRe_tel() {
        return re_tel;
    }

    public void setRe_tel(String re_tel) {
        this.re_tel = re_tel;
    }

    public String getRe_start_time() {
        return re_start_time;
    }

    public void setRe_start_time(String re_start_time) {
        this.re_start_time = re_start_time;
    }

    public Long getCumulative_duration() {
        return cumulative_duration;
    }

    public void setCumulative_duration(Long cumulative_duration) {
        this.cumulative_duration = cumulative_duration;
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
