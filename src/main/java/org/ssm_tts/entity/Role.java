package org.ssm_tts.entity;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @create 2019-08-18 12:40
 */
public class Role {
    public static final Integer PAGE_SIZE=8;
    /**
     *角色id
     */
     private Integer rid;
    /**
     *角色姓名
     */
     private String rname;
    /**
     *备用字段1
     */
    private String by1;
    /**
     *备用字段2
     */
    private String by2;
    /**
     *备用字段3
     */
    private Integer by3;
    /**
     *备用字段4
     */
    private String by4;
    /**
     *创建者的账号名
     */
    private String createuser;
    /**
     *创建时间
     */
    private String createtime;
    /**
     *更新者的账号名
     */
    private String updateuser;
    /**
     *更新时间
     */
    private String updatetime;
    /**
     * 角色所拥有的所有角权限名字的字符串
     */
    private String powerString;
    /**
     * 角色所拥有的所有权限id的集合
     */
    private List<Integer> pidList;

    @Override
    public String toString() {
        return "Role{" +
                "rid=" + rid +
                ", rname='" + rname + '\'' +
                ", by1='" + by1 + '\'' +
                ", by2='" + by2 + '\'' +
                ", by3=" + by3 +
                ", by4='" + by4 + '\'' +
                ", createuser='" + createuser + '\'' +
                ", createtime='" + createtime + '\'' +
                ", updateuser='" + updateuser + '\'' +
                ", updatetime='" + updatetime + '\'' +
                ", powerString='" + powerString + '\'' +
                ", pidList=" + pidList +
                '}';
    }

    public String getPowerString() {
        return powerString;
    }
    public Role(){}
    public Role(Integer rid,String rname,String updateuser){
        this.rid=rid;
        this.rname=rname;
        this.updateuser=updateuser;
    }
    public Role(String rname,String createuser){
        this.rname=rname;
        this.createuser=createuser;
    }
    public Role(Integer rid,String rname,List<Integer> pidList){
        this.rid=rid;
        this.rname=rname;
        this.pidList=pidList;
    }
    public List<Integer> getPidList() {
        return pidList;
    }

    public void setPidList(List<Integer> pidList) {
        this.pidList = pidList;
    }

    public void setPowerString(String powerString) {
        this.powerString = powerString;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getBy1() {
        return by1;
    }

    public void setBy1(String by1) {
        this.by1 = by1;
    }

    public String getBy2() {
        return by2;
    }

    public void setBy2(String by2) {
        this.by2 = by2;
    }

    public Integer getBy3() {
        return by3;
    }

    public void setBy3(Integer by3) {
        this.by3 = by3;
    }

    public String getBy4() {
        return by4;
    }

    public void setBy4(String by4) {
        this.by4 = by4;
    }

    public String getCreateuser() {
        return createuser;
    }

    public void setCreateuser(String createuser) {
        this.createuser = createuser;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getUpdateuser() {
        return updateuser;
    }

    public void setUpdateuser(String updateuser) {
        this.updateuser = updateuser;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }
}
