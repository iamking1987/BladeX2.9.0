package org.springblade.resource.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.segments.MergeSegments;
import org.springblade.core.mp.base.BaseServiceImpl;
import org.springblade.core.tool.utils.Func;
import org.springblade.resource.entity.Resmap;
import org.springblade.resource.entity.Sms;
import org.springblade.resource.mapper.ResmapMapper;
import org.springblade.resource.mapper.SmsMapper;
import org.springblade.resource.service.IResmapService;
import org.springblade.resource.service.ISmsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ResmapServiceImpl extends BaseServiceImpl<ResmapMapper, Resmap> implements IResmapService {

	@Override
	public Resmap getOneByOssLink(String link) {
		Wrapper<Resmap> wrapper = new QueryWrapper<Resmap>().lambda().eq(Resmap::getPrimitiveLink, link);
		Resmap one = this.getOne(wrapper);
		one = Func.isNotEmpty(one)? one:new Resmap()  ;
		return one;
	}

	@Override
	@Transactional
	public Boolean saveOrUpdateByPrimitiveLink(String primitiveLink, String newLink) {
		//为避免同一文件保存多次的错误，先删除blade-resmap中newLink的同名数据
		Wrapper<Resmap> wrapper = new QueryWrapper<Resmap>().lambda().likeLeft(Resmap::getNewLink, newLink);
		this.remove(wrapper);
		//Resmap one = this.getOneByOssLink(primitiveLink);
		Resmap one =new Resmap();
		one.setPrimitiveLink(primitiveLink);
		one.setNewLink(newLink);
		Boolean boolRes = this.saveOrUpdate(one);
		return boolRes;
	}

	@Override
	public String getPrimitiveLinkByUrl(String requestURI) {
		//从blade-resmap 中用右模糊方法查询oss存放地址
		Wrapper<Resmap> wrapper = new QueryWrapper<Resmap>().lambda().likeLeft(Resmap::getNewLink, requestURI);
		Resmap one = this.getOne(wrapper);
		String primitiveLink = Func.isNotEmpty(one)? one.getPrimitiveLink(): null;
		return primitiveLink;
	}
}
