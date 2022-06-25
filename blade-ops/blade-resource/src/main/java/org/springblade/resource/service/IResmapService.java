package org.springblade.resource.service;

import org.springblade.core.mp.base.BaseService;
import org.springblade.resource.entity.Attach;
import org.springblade.resource.entity.Resmap;

public interface IResmapService extends BaseService<Resmap> {

	Resmap getOneByOssLink(String link);

	Boolean saveOrUpdateByPrimitiveLink(String primitiveLink, String newLink);

	String getPrimitiveLinkByUrl(String requestURI);
}
