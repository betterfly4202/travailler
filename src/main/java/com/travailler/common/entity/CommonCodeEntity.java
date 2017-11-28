package com.travailler.common.entity;

import com.travailler.common.bean.CommonCodeVO;

/**
 * Created by betterFLY on 2017. 11. 28.
 * Github : http://github.com/betterfly88
 */

public class CommonCodeEntity {
    private String com_id;
    private String com_parent_id;
    private String com_order;
    private String com_value;
    private String com_comment;


    public CommonCodeVO convertCommonVO(){
        CommonCodeVO vo = new CommonCodeVO();
        vo.setComId(this.getCom_id());
        vo.setComParentId(this.getCom_parent_id());
        vo.setComOrder(this.getCom_order());
        vo.setComValue(this.getCom_value());
        vo.setComComment(this.getCom_comment());
        return vo;
    }


    public String getCom_id() {
        return com_id;
    }

    public void setCom_id(String com_id) {
        this.com_id = com_id;
    }

    public String getCom_parent_id() {
        return com_parent_id;
    }

    public void setCom_parent_id(String com_parent_id) {
        this.com_parent_id = com_parent_id;
    }

    public String getCom_order() {
        return com_order;
    }

    public void setCom_order(String com_order) {
        this.com_order = com_order;
    }

    public String getCom_value() {
        return com_value;
    }

    public void setCom_value(String com_value) {
        this.com_value = com_value;
    }

    public String getCom_comment() {
        return com_comment;
    }

    public void setCom_comment(String com_comment) {
        this.com_comment = com_comment;
    }
}
