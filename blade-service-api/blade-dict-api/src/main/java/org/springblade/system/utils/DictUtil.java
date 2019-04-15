package org.springblade.system.utils;

import org.springblade.core.cache.constant.CacheConstant;
import org.springblade.core.cache.utils.CacheUtil;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.utils.Func;
import org.springblade.core.tool.utils.SpringUtil;
import org.springblade.core.tool.utils.StringPool;
import org.springblade.system.entity.Dict;
import org.springblade.system.feign.IDictClient;

import java.util.List;

/**
 * DictUtil
 *
 * @author Chill
 */
public class DictUtil {

	private static IDictClient dictClient = SpringUtil.getBean(IDictClient.class);

	/**
	 * 获取字典值
	 *
	 * @param code    字典编号
	 * @param dictKey 字典键
	 * @return
	 */
	public static String getValue(String code, Integer dictKey) {
		String dictValue = CacheUtil.get(CacheConstant.DICT_VALUE, code + StringPool.UNDERSCORE + dictKey, String.class);
		if (Func.isEmpty(dictValue)) {
			R<String> result = dictClient.getValue(code, dictKey);
			if (result.isSuccess()) {
				CacheUtil.put(CacheConstant.DICT_VALUE, code + StringPool.UNDERSCORE + dictKey, result.getData());
				return result.getData();
			} else {
				return StringPool.EMPTY;
			}
		} else {
			return dictValue;
		}
	}

	/**
	 * 获取字典集合
	 *
	 * @param code 字典编号
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Dict> getList(String code) {
		Object dictList = CacheUtil.get(CacheConstant.DICT_LIST, code);
		if (Func.isEmpty(dictList)) {
			R<List<Dict>> result = dictClient.getList(code);
			if (result.isSuccess()) {
				CacheUtil.put(CacheConstant.DICT_LIST, code, result.getData());
				return result.getData();
			} else {
				return null;
			}
		} else {
			return (List<Dict>) dictList;
		}
	}

}
