package org.ssm_tts.entity;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @createtime 2019-09-14 19:29
 */

public class RP {
    private Role role;
    private Integer pid;

    public RP(Role role, Integer pid) {
        this.role = role;
        this.pid = pid;
    }
    public RP(){}
    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}
