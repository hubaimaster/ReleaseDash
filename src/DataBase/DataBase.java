package DataBase;

import org.omg.CORBA.Request;

import Objects.Document;
import Objects.User;
import Objects.WebFile;

public class DataBase {

	public static User getUser(String userName, String userPassword){
		User user = new User();
		user.userGender = "남자";
		user.userId = "user0";
		user.userName = "김창환";
		user.userStudentNumber = "20151537";
		return user;
	}
	
	public static User getUser(String userId){
		User user = new User();
		user.userGender = "남자";
		user.userId = "user0";
		user.userName = "김창환";
		user.userStudentNumber = "20151537";
		return user;
	}
	
	public static Document[] getDocuments(String boardId){
		Document[] documents = new Document[10];
		for (int i = 0; i < documents.length; i++){
			documents[i] = new Document();
			documents[i].content = "안녕하세요 김창환 테스트 게시물입니다.";
			documents[i].documentId = "document"+i;
			documents[i].file1Id = "";
			documents[i].file2Id = "";
			documents[i].title = "안녕하세요 테스트" +i + "번 게시물입니다.";
			documents[i].writerId = "user0";
		}
		return documents;
	}
	
	public static WebFile getWebFile(String fileId){
		WebFile webFile = new WebFile();
		webFile.fileId = "file0";
		webFile.fileUrl = "";
		return webFile;
	}
	
}
