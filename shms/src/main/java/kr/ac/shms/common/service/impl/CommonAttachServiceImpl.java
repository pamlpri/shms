package kr.ac.shms.common.service.impl;

import java.io.ByteArrayInputStream;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.ac.shms.common.dao.CommonAttachDAO;
import kr.ac.shms.common.service.CommonAttachService;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.IAttachVO;

@Service
public class CommonAttachServiceImpl implements CommonAttachService {
	private static final Logger logger = LoggerFactory.getLogger(CommonAttachServiceImpl.class);
	
	@Inject
	private CommonAttachDAO commonAttachDAO;
	
	@Value("#{appInfo['ip']}")
	private String ip;
	@Value("#{appInfo['port']}")
	private int port;
	@Value("#{appInfo['id']}")
	private String id;
	@Value("#{appInfo['pw']}")
	private String pw;
	
	@Override
	public List<AttachVO> attachList(int param) {
		return commonAttachDAO.attachList(param);
	}
	
	@Override
	public int atch_file_seqCount(int atch_file_no) {
		return commonAttachDAO.atch_file_seqCount(atch_file_no);
	}
	
	@Override
	public AttachVO download(AttachVO attachVO, String use_type) {
		AttachVO attach = commonAttachDAO.selectAttatch(attachVO);
		if(use_type != null) {
			attach.setUse_type(use_type);
		}
		return attach;
	}
	
	@Override
	public int processes(IAttachVO iattachVO, String dir) {
		int cnt = 0;		
		List<AttachVO> attachList = iattachVO.getAttachList();
		if(attachList!=null && attachList.size()>0) {
		
			FTPClient client = new FTPClient();
			try {
				client.connect(ip, port);
				int reply = client.getReplyCode();
				logger.info("client Connect : {}", reply);
				if(FTPReply.isPositiveCompletion(reply)) { // 접속 연결이 됐을 경우 
					if(client.login(id, pw)) {	// FTP 서버 로그인 성공 했을 경우
						System.out.println("Login Success");
						client.setBufferSize(1000);	// 버퍼 사이즈
						client.enterLocalPassiveMode();	// 공유기를 상대로 파일 전송하기 위해 패시브 모드로 지정해줘야함
						
						boolean isDirectory = client.changeWorkingDirectory(dir);	// 파일 경로 지정
						for(AttachVO attach : attachList) {
							attach.setFile_path(dir);
						}
						logger.info("isDir : {} || {}",isDirectory, dir);
						if(!isDirectory) {
							client.mkd(dir);
						}
						client.setFileType(FTP.BINARY_FILE_TYPE);
						
						boolean isUpload = false;
						for(AttachVO attvo : iattachVO.getAttachList()) {
							logger.info("attvo {}", attvo);
							isUpload = client.storeFile(attvo.getSave_file_nm(), new ByteArrayInputStream(attvo.getFile().getBytes()));
							logger.info("isUpload {}", isUpload);
							if(!isUpload) {
								client.logout();
								break;
							}
						}
						logger.info("isUpload : {}", isUpload);
						if(isUpload) cnt += commonAttachDAO.insertAttatches(iattachVO);
						
						client.logout();
						client.disconnect();
					} else {
						client.disconnect(); // 연결 종료
					}
				}
			} catch(Exception e) {
				
			}
		}
		return cnt;
	}
	
	@Override
	public int deleteFileProcesses(IAttachVO iattachVO, String dir) {
		logger.info("deleteFileProcesses : {}", iattachVO);
		FTPClient client = new FTPClient();
		int cnt = 0;
		int[] delAttNos = iattachVO.getDelAttNos();
		if(delAttNos!=null && delAttNos.length > 0) {
			List<String> saveNames = commonAttachDAO.selectSaveNamesForDelete(iattachVO);
			logger.info("saveNames : {}", saveNames.size());
			try {
				client.connect(ip, port);
				int reply = client.getReplyCode();
				logger.info("client Connect : {}", reply);
				if(FTPReply.isPositiveCompletion(reply)) { // 접속 연결이 됐을 경우 
					if(client.login(id, pw)) {	// FTP 서버 로그인 성공 했을 경우
						System.out.println("Login Success");
						client.setBufferSize(1000);	// 버퍼 사이즈
						client.enterLocalPassiveMode();	// 공유기를 상대로 파일 전송하기 위해 패시브 모드로 지정해줘야함

						boolean isDirectory = client.changeWorkingDirectory(dir);	// 파일 경로 지정
						logger.info("isDir : {} || {}",isDirectory, dir);
//						if(!isDirectory) {
//							client.mkd(attatchPath);
//						}
						client.setFileType(FTP.BINARY_FILE_TYPE);
						
//						이진 데이터 삭제
						for(String saveName : saveNames) {
							client.deleteFile(saveName);
						}
//						첨부파일의 메타 데이터 삭제
						commonAttachDAO.deleteAttathes(iattachVO);
						
						
						client.logout();
						client.disconnect();
					} else {
						client.disconnect(); // 연결 종료
					}
				}
			} catch(Exception e) {
				
			}
		}
		return cnt;
	}
}
