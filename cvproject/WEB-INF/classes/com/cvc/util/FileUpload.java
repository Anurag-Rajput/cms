package com.cvc.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author dell
 *
 */
public class FileUpload {

	
	public static File rename(MultipartFile file, String rootPath) {
		String fileName = file.getOriginalFilename();
		//System.out.println(fileName);
		// fileName= System.DateTime.Now.ToString("_ddMMyyhhmmss") +
		// file.Extension;
		String extension = fileName.substring((fileName.lastIndexOf('.')));
		UUID uuid = UUID.randomUUID();
		String name = uuid.toString();
		//System.out.println("time  String = " + name);
		fileName = name + extension;
		System.out.println(fileName);
		String filePath = rootPath + "/" + fileName;
		//System.out.println(filePath);
		File storeFile = new File(filePath);
		return storeFile;
	}

	
	public static File uploadFile(MultipartFile file, String path) throws Exception {
		File serverFile=null;
		BufferedOutputStream stream=null;
		if(file.getSize()<128 || file.getSize()>5e+9){
			throw new Exception("File size is less than 1 byte");
		}
		
		try {
			serverFile = null;
			byte[] bytes = file.getBytes();
			File dir = new File(path);
			if (!dir.exists())
				dir.mkdirs();
			serverFile = FileUpload.rename(file, path);
			stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(bytes);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(stream!=null)
			stream.close();
		}
		return serverFile;

	}

	
	public static boolean imageValidate(MultipartFile file) {
		boolean flag = false;
		String Pattern = "([a-zA-Z0-9\\s_\\.\\-:])+(.png|.jpg|.gif)$";
		String fileName = file.getOriginalFilename();
		if (!fileName.matches(Pattern)) {
			System.out.println("Returning  edit design page  not a valid image");
		} else if (fileName.matches(Pattern)) {

			flag = true;
		}

		return flag;
	}
	
	
	/**
	 * @param file
	 * @return
	 */
	public static boolean fileValidate(MultipartFile file) {
		boolean flag = false;
		String Pattern = "([a-zA-Z0-9)(\\s_\\.\\-:])+(.jpeg|.jpg|.png|.pdf|.PDF)$";
		String fileName = file.getOriginalFilename();
		if (!fileName.matches(Pattern)) {
			System.out.println("Returning  edit design page  not a valid file");
		} else if (fileName.matches(Pattern)) {

			flag = true;
		}

		return flag;
	}
	
	/**
	 * @param file
	 * @return
	 */
	public static boolean wordFileValidate(MultipartFile file) {
		boolean flag = false;
		String Pattern = "([a-zA-Z0-9)(\\s_\\.\\-:])+(.doc|.DOC|.docx|.DOCX|.rtf|.RTF|.png|.jpg|.gif|.pdf|.PDF)$";
		String fileName = file.getOriginalFilename();
		if (!fileName.matches(Pattern)) {
			System.out.println("Returning  edit design page  not a valid file");
		} else if (fileName.matches(Pattern)) {

			flag = true;
		}

		return flag;
	}

}








