package org.ssm_tts.entity;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @create 2019-08-18 13:32
 */
public class Power {
    /**
     *权限id
     */
     private Integer pid;
    /**
     *菜单的css的样式
     */
     private String pclass;
    /**
     *菜单的url路劲
     */
     private String purl;
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

    @Override
    public String toString() {
        return "Power{" +
                "pid=" + pid +
                ", pclass='" + pclass + '\'' +
                ", purl='" + purl + '\'' +
                ", by1='" + by1 + '\'' +
                ", by2='" + by2 + '\'' +
                ", by3=" + by3 +
                ", by4='" + by4 + '\'' +
                ", createuser='" + createuser + '\'' +
                ", createtime='" + createtime + '\'' +
                ", updateuser='" + updateuser + '\'' +
                ", updatetime='" + updatetime + '\'' +
                '}';
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPclass() {
        return pclass;
    }

    public void setPclass(String pclass) {
        this.pclass = pclass;
    }

    public String getPurl() {
        return purl;
    }

    public void setPurl(String purl) {
        this.purl = purl;
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
