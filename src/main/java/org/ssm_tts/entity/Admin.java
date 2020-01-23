package org.ssm_tts.entity;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @create 2019-08-18 12:28
 */
public class Admin {
    public static final int PAGE_SIZE=8;
    /**
     *管理员的id
     */
     private Integer aid;
    /**
     *管理员的真实姓名
     */
     private String aname;
    /**
     *管理员的账户名
     */
     private String auname;
    /**
     *管理员的密码
     */
     private String apassword;
    /**
     *管理员的头像
     */
     private String aimage;
    /**
     *管理员的电话
     */
     private String atel;
    /**
     *管理员的邮箱
     */
     private String aemail;
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
     *权限的集合
     */
     private List<Power> powerList;
    /**
     * 管理员所拥有的所有角色的字符串
     */
     private String roleString;
    /**
     * 管理员所拥有的所有角色id的集合
     */
    private List<Integer> ridList;

    @Override
    public String toString() {
        return "Admin{" +
                "aid=" + aid +
                ", aname='" + aname + '\'' +
                ", auname='" + auname + '\'' +
                ", apassword='" + apassword + '\'' +
                ", aimage='" + aimage + '\'' +
                ", atel='" + atel + '\'' +
                ", aemail='" + aemail + '\'' +
                ", by1='" + by1 + '\'' +
                ", by2='" + by2 + '\'' +
                ", by3=" + by3 +
                ", by4='" + by4 + '\'' +
                ", createuser='" + createuser + '\'' +
                ", createtime='" + createtime + '\'' +
                ", updateuser='" + updateuser + '\'' +
                ", updatetime='" + updatetime + '\'' +
                ", powerList=" + powerList +
                ", roleString='" + roleString + '\'' +
                '}';
    }

    public Admin(String auname, String apassword) {
        this.auname = auname;
        this.apassword = apassword;
    }


    public Admin(){

    }
    public Admin(Integer aid,String aname, String atel, String aemail,String updateuser) {
        this.aid=aid;
        this.aname = aname;
        this.atel = atel;
        this.aemail = aemail;
        this.updateuser=updateuser;
    }
    public Admin(Integer aid,String auname,String aname, String atel, String aemail,String aimage) {
        this.aid=aid;
        this.auname=auname;
        this.aname = aname;
        this.atel = atel;
        this.aemail = aemail;
        this.aimage=aimage;
    }

    public Admin(Integer aid, String aname, String apassword) {
        this.aid = aid;
        this.aname = aname;
        this.apassword = apassword;
    }

    public List<Integer> getRidList() {
        return ridList;
    }

    public void setRidList(List<Integer> ridList) {
        this.ridList = ridList;
    }

    public String getRoleString() {
        return roleString;
    }

    public void setRoleString(String roleString) {
        this.roleString = roleString;
    }

    public List<Power> getPowerList() {
        return powerList;
    }

    public void setPowerList(List<Power> powerList) {
        this.powerList = powerList;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getAuname() {
        return auname;
    }

    public void setAuname(String auname) {
        this.auname = auname;
    }

    public String getApassword() {
        return apassword;
    }

    public void setApassword(String apassword) {
        this.apassword = apassword;
    }

    public String getAimage() {
        return aimage;
    }

    public void setAimage(String aimage) {
        this.aimage = aimage;
    }

    public String getAtel() {
        return atel;
    }

    public void setAtel(String atel) {
        this.atel = atel;
    }

    public String getAemail() {
        return aemail;
    }

    public void setAemail(String aemail) {
        this.aemail = aemail;
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
