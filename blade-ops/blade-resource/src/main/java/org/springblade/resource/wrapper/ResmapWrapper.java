package org.springblade.resource.wrapper;

import org.springblade.core.mp.support.BaseEntityWrapper;
import org.springblade.core.tool.utils.BeanUtil;
import org.springblade.resource.entity.Oss;
import org.springblade.resource.entity.Resmap;
import org.springblade.resource.vo.OssVO;
import org.springblade.resource.vo.ResmapVO;
import org.springblade.system.cache.DictCache;
import org.springblade.system.enums.DictEnum;

import java.util.Objects;

public class ResmapWrapper extends BaseEntityWrapper<Resmap, ResmapVO> {

	public static ResmapWrapper build() {
		return new ResmapWrapper();
	}

	@Override
	public ResmapVO entityVO(Resmap resmap) {
		ResmapVO resmapVO = Objects.requireNonNull(BeanUtil.copy(resmap, ResmapVO.class));

		return resmapVO;
	}

}
