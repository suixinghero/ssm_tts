package org.ssm_tts.entity;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @createtime 2019-12-11 11:42
 *
 * 资费对象
 */

public class Fee {
    public static final Integer PAGE_SIZE=8;
    private Integer id;            //资费id
    private String ac_name;        //资费名称
    private Integer base_duration; //基础时长
    private Double base_cost;      //基础费用
    private Double unit_cost;      //单位费用
    private Integer ac_type;       //资费套餐：0：包月、1：套餐、3：计时
    private String ac_desc;        //资费说明
    private Integer ac_status;     //资费状态：0：暂停、1：开通、2：删除
    private String createtime;     //创建时间
    private String starttime;      //开通时间
    private Integer sortFlag;      //排序标识
    private String extinfo1;       //扩展字段1
    private Integer extinfo2;      //扩展字段2
    private String extinfo3;       //扩展字段3

    @Override
    public String toString() {
        return "Fee{" +
                "id=" + id +
                ", ac_name='" + ac_name + '\'' +
                ", base_duration=" + base_duration +
                ", base_cost=" + base_cost +
                ", unit_cost=" + unit_cost +
                ", ac_type=" + ac_type +
                ", ac_desc='" + ac_desc + '\'' +
                ", ac_status=" + ac_status +
                ", createtime='" + createtime + '\'' +
                ", starttime='" + starttime + '\'' +
                ", sortFlag=" + sortFlag +
                ", extinfo1='" + extinfo1 + '\'' +
                ", extinfo2=" + extinfo2 +
                ", extinfo3='" + extinfo3 + '\'' +
                '}';
    }

    public Integer getSortFlag() {
        return sortFlag;
    }

    public void setSortFlag(Integer sortFlag) {
        this.sortFlag = sortFlag;
    }

    public static int getPageSize() {
        return PAGE_SIZE;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAc_name() {
        return ac_name;
    }

    public void setAc_name(String ac_name) {
        this.ac_name = ac_name;
    }

    public Integer getBase_duration() {
        return base_duration;
    }

    public void setBase_duration(Integer base_duration) {
        this.base_duration = base_duration;
    }

    public Double getBase_cost() {
        return base_cost;
    }

    public void setBase_cost(Double base_cost) {
        this.base_cost = base_cost;
    }

    public Double getUnit_cost() {
        return unit_cost;
    }

    public void setUnit_cost(Double unit_cost) {
        this.unit_cost = unit_cost;
    }

    public Integer getAc_type() {
        return ac_type;
    }

    public void setAc_type(Integer ac_type) {
        this.ac_type = ac_type;
    }

    public String getAc_desc() {
        return ac_desc;
    }

    public void setAc_desc(String ac_desc) {
        this.ac_desc = ac_desc;
    }

    public Integer getAc_status() {
        return ac_status;
    }

    public void setAc_status(Integer ac_status) {
        this.ac_status = ac_status;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
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
