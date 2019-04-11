package org.springblade.flowable.engine.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 流程模型
 *
 * @author Chill
 */
@Data
@TableName("ACT_DE_MODEL")
public class FlowModel implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	private String name;
	private String modelKey;
	private String description;
	private Date created;
	private Date lastUpdated;
	private String createdBy;
	private String lastUpdatedBy;
	private Integer version;
	private String modelEditorJson;
	private String modelComment;
	private Integer modelType;
	private String tenantId;
	private byte[] thumbnail;

}
