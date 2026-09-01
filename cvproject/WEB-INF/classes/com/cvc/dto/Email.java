package com.cvc.dto;

import java.util.Date;

import javax.mail.Multipart;

import org.springframework.web.multipart.MultipartFile;

public class Email {

	private Integer emailId;
	private String applicationName;
	private String mailServerIp;
	private String authId;
	private String authPassword;
	private String senderEmail;
	private String recepientEmail;
	private String subject;
	private String emailFrom;
	private String replyTo;
	private String emailContent;
	private Integer status;
	private byte[] attachment;
	private String attachmentName;
	private boolean invalidReceipientId;
	private String carbanCopy;
	private String blankcarbonCopy;
	private Date sendingTime;
	private Date deliverTime;
	private MultipartFile[] file;
	
	public Integer getEmailId() {
		return emailId;
	}
	public void setEmailId(Integer emailId) {
		this.emailId = emailId;
	}
	public String getApplicationName() {
		return applicationName;
	}
	public void setApplicationName(String applicationName) {
		this.applicationName = applicationName;
	}
	public String getMailServerIp() {
		return mailServerIp;
	}
	public void setMailServerIp(String mailServerIp) {
		this.mailServerIp = mailServerIp;
	}
	public String getAuthId() {
		return authId;
	}
	public void setAuthId(String authId) {
		this.authId = authId;
	}
	public String getAuthPassword() {
		return authPassword;
	}
	public void setAuthPassword(String authPassword) {
		this.authPassword = authPassword;
	}
	public String getSenderEmail() {
		return senderEmail;
	}
	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}
	public String getRecepientEmail() {
		return recepientEmail;
	}
	public void setRecepientEmail(String recepientEmail) {
		this.recepientEmail = recepientEmail;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getEmailFrom() {
		return emailFrom;
	}
	public void setEmailFrom(String emailFrom) {
		this.emailFrom = emailFrom;
	}
	public String getReplyTo() {
		return replyTo;
	}
	public void setReplyTo(String replyTo) {
		this.replyTo = replyTo;
	}
	public String getEmailContent() {
		return emailContent;
	}
	public void setEmailContent(String emailContent) {
		this.emailContent = emailContent;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public byte[] getAttachment() {
		return attachment;
	}
	public void setAttachment(byte[] attachment) {
		this.attachment = attachment;
	}
	public String getAttachmentName() {
		return attachmentName;
	}
	public void setAttachmentName(String attachmentName) {
		this.attachmentName = attachmentName;
	}
	public boolean isInvalidReceipientId() {
		return invalidReceipientId;
	}
	public void setInvalidReceipientId(boolean invalidReceipientId) {
		this.invalidReceipientId = invalidReceipientId;
	}
	public String getCarbanCopy() {
		return carbanCopy;
	}
	public void setCarbanCopy(String carbanCopy) {
		this.carbanCopy = carbanCopy;
	}
	public String getBlankcarbonCopy() {
		return blankcarbonCopy;
	}
	public void setBlankcarbonCopy(String blankcarbonCopy) {
		this.blankcarbonCopy = blankcarbonCopy;
	}
	public Date getSendingTime() {
		return sendingTime;
	}
	public void setSendingTime(Date sendingTime) {
		this.sendingTime = sendingTime;
	}
	public Date getDeliverTime() {
		return deliverTime;
	}
	public void setDeliverTime(Date deliverTime) {
		this.deliverTime = deliverTime;
	}
	public MultipartFile[] getFile() {
		return file;
	}
	public void setFile(MultipartFile[] file) {
		this.file = file;
	}

}
