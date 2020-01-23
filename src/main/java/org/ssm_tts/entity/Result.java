package org.ssm_tts.entity;

/**
 * @author xujin
 * @package-name org.ssm_tts.entity
 * @createtime 2019-12-12 16:44
 * 前端接收的结果对象
 */

public class Result<T> {
    private String code;
    private String msg;
    private T data;

    public Result(String code,String msg){
        this.code=code;
        this.msg=msg;
    }
    public Result(String code,String msg,T data){
        this.code=code;
        this.msg=msg;
        this.data=data;
    }
    public Result(){

    }
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
