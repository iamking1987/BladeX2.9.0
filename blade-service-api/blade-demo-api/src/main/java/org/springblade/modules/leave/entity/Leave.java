/*
 *      Copyright (c) 2018-2028, Chill Zhuang All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 *  Redistributions of source code must retain the above copyright notice,
 *  this list of conditions and the following disclaimer.
 *  Redistributions in binary form must reproduce the above copyright
 *  notice, this list of conditions and the following disclaimer in the
 *  documentation and/or other materials provided with the distribution.
 *  Neither the name of the dreamlu.net developer nor the names of its
 *  contributors may be used to endorse or promote products derived from
 *  this software without specific prior written permission.
 *  Author: Chill 庄骞 (smallchill@163.com)
 */
package org.springblade.modules.leave.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import org.springblade.core.mp.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 请假流程测试表实体类
 *
 * @author Blade
 * @since 2022-02-20
 */
@Data
@TableName("blade_leave")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "Leave对象", description = "请假流程测试表")
public class Leave extends BaseEntity {

    private static final long serialVersionUID = 1L;

  private Long id;
    /**
     * 流程实例ID
     */
    @ApiModelProperty(value = "流程实例ID")
    private String processInsId;
    /**
     * 请假理由
     */
    @ApiModelProperty(value = "请假理由")
    private String reason;
    /**
     * 请假天数
     */
    @ApiModelProperty(value = "请假天数")
    private Integer days;
    /**
     * 请假人
     */
    @ApiModelProperty(value = "请假人")
    private Long applyUser;
    /**
     * 处理阶段
     */
    @ApiModelProperty(value = "处理阶段")
    private String phase;


}
