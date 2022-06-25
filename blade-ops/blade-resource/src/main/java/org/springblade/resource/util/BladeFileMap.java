package org.springblade.resource.util;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.apache.commons.lang.StringUtils;
import org.springblade.core.oss.model.BladeFile;
import org.springblade.core.secure.utils.AuthUtil;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.StringUtil;
import org.springblade.resource.entity.Resmap;
import org.springblade.resource.service.IResmapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@NoArgsConstructor
public  class   BladeFileMap {

	@Value("${oss.deployServerIp}")
    private String deployServerIp;
	@Value("${oss.loginServerIp}")
    private String loginServerIp;

	@Autowired
	private IResmapService resmapService ;

	public BladeFile toLoginServerFlie(BladeFile bladeFile){

		String domain = bladeFile.getDomain();
		String link = bladeFile.getLink();
		String newDomain = domain.replace(deployServerIp, loginServerIp);
		String newLink = link.replace(deployServerIp, loginServerIp);
        //取用户名 拼接新文件名
		String userName = Func.isNotEmpty(AuthUtil.getNickName())? AuthUtil.getNickName():AuthUtil.getUserName();
		String newfileName =userName+"_" + bladeFile.getOriginalName();

		int i = newLink.indexOf("upload/");
		String dateDir = newLink.subSequence(i + 7, i + 15).toString();
		String   newLink2= "http://localhost:1888"+"/api/blade-resource/oss/endpoint/get-file/"+dateDir+"/"+newfileName;
		//把地址映射保存
		resmapService.saveOrUpdateByPrimitiveLink(link,newLink2);

		BladeFile file = new BladeFile();
		file.setAttachId(bladeFile.getAttachId());
		file.setDomain(newDomain);
		file.setLink(newLink2);
		file.setName(bladeFile.getName());
		file.setOriginalName(bladeFile.getOriginalName());
		return file;
	}
}
