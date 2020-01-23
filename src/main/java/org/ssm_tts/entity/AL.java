package org.ssm_tts.entity;

import java.util.List;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @createtime 2019-09-19 18:32
 *
 */

public class AL {
    private String updateuser;
    private List<Integer> aidList;

    public AL(String updateuser, List<Integer> aidList) {
        this.updateuser = updateuser;
        this.aidList = aidList;
    }
    public AL(){}

    public String getUpdateuser() {
        return updateuser;
    }

    public void setUpdateuser(String updateuser) {
        this.updateuser = updateuser;
    }

    public List<Integer> getAidList() {
        return aidList;
    }

    public void setAidList(List<Integer> aidList) {
        this.aidList = aidList;
    }
}
