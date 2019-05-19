package org.springblade.desk.controller;

import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import org.springblade.core.minio.MinioTemplate;
import org.springblade.core.tool.api.R;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * UploadController
 *
 * @author Chill
 */
@RequestMapping("upload")
@RestController
@AllArgsConstructor
public class UploadController {

	private MinioTemplate minioTemplate;

	/**
	 * minio上传demo
	 *
	 * @param file 上传文件
	 * @return
	 */
	@SneakyThrows
	@PostMapping("put-object")
	public R putObject(@RequestParam MultipartFile file) {
		minioTemplate.putObject("test233", file.getOriginalFilename(), file.getInputStream());
		return R.success("操作成功");
	}

}
