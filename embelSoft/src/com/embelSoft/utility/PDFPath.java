package com.embelSoft.utility;

public class PDFPath {

	private String LocalPath="C:/logo.png";

	private String serverPath="/home/embelsof/logo.png";

	public String getLocalPath() {
		return LocalPath;
	}

	public void setLocalPath(String localPath) {
		LocalPath = localPath;
	}

	public String getServerPath() {
		return serverPath;
	}

	public void setServerPath(String serverPath) {
		this.serverPath = serverPath;
	}

}
