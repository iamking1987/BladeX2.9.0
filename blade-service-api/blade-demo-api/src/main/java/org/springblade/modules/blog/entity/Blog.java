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
package org.springblade.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import org.springblade.core.mp.base.BaseEntity;
import java.time.LocalDateTime;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 实体类
 *
 * @author Blade
 * @since 2022-01-29
 */
@Data
@TableName("blade_blog")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "Blog对象", description = "Blog对象")
public class Blog extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ApiModelProperty(value = "主键")
    private Long id;
    /**
     * 标题
     */
    @ApiModelProperty(value = "标题")
    private String blogTitle;
    /**
     * 发布内容
     */
    @ApiModelProperty(value = "发布内容")
    private String blogContent;
    /**
     * 发布日期
     */
    @ApiModelProperty(value = "发布日期")
    private LocalDateTime blogDate;


}
