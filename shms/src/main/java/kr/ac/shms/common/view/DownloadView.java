package kr.ac.shms.common.view;

import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.logging.log4j.core.config.plugins.validation.constraints.Required;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.view.AbstractView;

import kr.ac.shms.common.vo.AttachVO;

/**
 * @author 작성자명
 * @since 2021. 5. 31.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 31.      최희수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public class DownloadView extends AbstractView {
	private static final Logger logger =
			LoggerFactory.getLogger(DownloadView.class);
	@Value("#{appInfo['ip']}")
	private String ip;
	@Value("#{appInfo['port']}")
	private int port;
	@Value("#{appInfo['id']}")
	private String id;
	@Value("#{appInfo['pw']}")
	private String pw;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model
			, HttpServletRequest req
			, HttpServletResponse resp
		) throws Exception {
		
		AttachVO attach = (AttachVO) model.get("attvo");
		String dir = attach.getFile_path();
		
		FTPClient client = new FTPClient();
		FileOutputStream fos = null;
		boolean isSuccess = false;
		String agent = req.getHeader("User-Agent");
		try {
			client.connect(ip,port);
			int reply = client.getReplyCode();
			if(!FTPReply.isPositiveCompletion(reply)) {
				logger.info("FTP 연결 실패");
				client.disconnect();
			}
			if(!client.login(id, pw)) {
				logger.info("FTP 로그인 실패");
				client.logout();
			}
			
			client.changeWorkingDirectory(dir);
			
			try {
				String fileName = attach.getFile_nm();
				logger.info("fileName : {}", fileName);
				if(StringUtils.containsIgnoreCase(agent, "trident")) {
					fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", " ");
				} else {
					byte[] bytes = fileName.getBytes();
					fileName = new String(bytes, "ISO-8859-1");
					logger.info("use_type {}",attach.getUse_type());
					if(StringUtils.isNotBlank(attach.getUse_type())) {
						resp.setHeader("Content-Disposition", "inline;filename=\""+fileName+"\"");
						resp.setHeader("Content-Length", attach.getFile_size()+"");
						resp.setContentType("application/pdf");
					}else {
						resp.setHeader("Content-Disposition", "attatchment;filename=\""+fileName+"\"");
						resp.setHeader("Content-Length", attach.getFile_size()+"");
						resp.setContentType("application/octet-stream");
					}
					isSuccess = client.retrieveFile(attach.getSave_file_nm(), resp.getOutputStream());
					if(isSuccess) {
						logger.info("download Success");
					} else {
						logger.info("download Fail");
					}
				}
			} catch(IOException ioe) {
				
			} finally {
				if (fos != null) try {fos.close();}catch(IOException e) {}
			}
			client.disconnect();			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(client != null && client.isConnected()) {
				try {client.disconnect(); } catch(IOException e) {}
			}
		}

	}

}
