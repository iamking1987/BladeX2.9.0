package org.springblade.resource.vo;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springblade.resource.entity.Attach;
import org.springblade.resource.entity.Resmap;

@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "ResmapVO对象", description = "资源名称表")
public class ResmapVO extends Resmap {
	private static final long serialVersionUID = 1L;

}
