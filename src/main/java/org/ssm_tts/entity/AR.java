package org.ssm_tts.entity;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @createtime 2019-09-17 19:45
 * 管理员角色关联对象
 */

public class AR {
    private Admin admin;
    private Integer rid;

    public AR(Admin admin, Integer rid) {
        this.admin = admin;
        this.rid = rid;
    }
    public AR(){}
    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }
}
