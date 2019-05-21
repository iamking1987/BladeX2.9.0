package org.springblade.desk.controller;

import com.qiniu.http.Response;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import org.springblade.core.minio.MinioTemplate;
import org.springblade.core.qiniu.QiniuTemplate;
import org.springblade.core.tool.api.R;
import org.springblade.core.tool.jackson.JsonUtil;
import org.springblade.core.tool.support.Kv;
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
@RestController
@AllArgsConstructor
@RequestMapping("/notice/upload")
public class UploadController {

	private MinioTemplate minioTemplate;

	private QiniuTemplate qiniuTemplate;

	/**
	 * minio上传demo
	 *
	 * @param file       上传文件
	 * @param bucketName 存储桶名称
	 * @return String
	 */
	@SneakyThrows
	@PostMapping("put-minio-object")
	public R<String> putMinioObject(@RequestParam MultipartFile file, @RequestParam String bucketName) {
		minioTemplate.putObject(bucketName, file.getOriginalFilename(), file.getInputStream());
		String objectUrl = minioTemplate.getObjectUrl(bucketName, file.getOriginalFilename());
		return R.data(objectUrl);
	}

	/**
	 * qiniu上传demo
	 *
	 * @param file    上传文件
	 * @param fileKey 上传文件key
	 * @return String
	 */
	@SneakyThrows
	@PostMapping("put-qiniu-object")
	public R<Kv> putQiniuObject(@RequestParam MultipartFile file, @RequestParam String fileKey) {
		Response put = qiniuTemplate.put(file.getInputStream(), fileKey);
		Kv parse = JsonUtil.parse(put.bodyString(), Kv.class);
		return R.data(parse);
	}

}
