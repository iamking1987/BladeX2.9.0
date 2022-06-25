package org.springblade.plugin.workflow.core.utils;

import org.springframework.util.ObjectUtils;

import java.util.stream.Stream;

/**
 * 扩展ObjectUtil
 *
 * @author ssc
 */
public class ObjectUtil extends org.springblade.core.tool.utils.ObjectUtil {

	public static boolean isAnyEmpty(Object... obj) {
		return isEmpty(obj) || Stream.of(obj).anyMatch(ObjectUtils::isEmpty);
	}

}
