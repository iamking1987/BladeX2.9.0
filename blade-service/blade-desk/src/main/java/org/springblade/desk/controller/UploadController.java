package org.springblade.desk.controller;

import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import org.springblade.core.minio.MinioTemplate;
import org.springblade.core.tool.api.R;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * UploadController
 *
 * @author Chill
 */
@RequestMapping("/notice/upload")
@RestController
@AllArgsConstructor
public class UploadController {

	private MinioTemplate minioTemplate;

	/**
	 * minio上传demo
	 *
	 * @param file 上传文件
	 * @return String
	 */
	@SneakyThrows
	@PostMapping("put-object")
	public R<String> putObject(@RequestParam MultipartFile file, @RequestParam String bucketName) {
		minioTemplate.putObject(bucketName, file.getOriginalFilename(), file.getInputStream());
		String objectUrl = minioTemplate.getObjectUrl(bucketName, file.getOriginalFilename());
		return R.data(objectUrl);
	}

}
