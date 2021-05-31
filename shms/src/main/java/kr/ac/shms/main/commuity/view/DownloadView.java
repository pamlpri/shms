package kr.ac.shms.main.commuity.view;

import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.view.AbstractView;

import kr.ac.shms.main.commuity.vo.AttachVO;

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
			, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		
		AttachVO attatch = (AttachVO) model.get("attvo");
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
			String dir = "/test";
			client.changeWorkingDirectory(dir);
			
			try {
				String fileName = attatch.getFile_nm();
				logger.info("fileName : {}", fileName);
				if(StringUtils.containsIgnoreCase(agent, "trident")) {
					fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", " ");
				} else {
					byte[] bytes = fileName.getBytes();
					fileName = new String(bytes, "ISO-8859-1");
					resp.setHeader("Content-Disposition", "attatchment;filename=\""+fileName+"\"");
					resp.setHeader("Content-Length", attatch.getFile_size()+"");
					resp.setContentType("application/octet-stream");
					isSuccess = client.retrieveFile(attatch.getSave_file_nm(), resp.getOutputStream());
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
