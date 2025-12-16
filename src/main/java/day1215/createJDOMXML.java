package day1215;

import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;


/**
 * Parser를 사용한 XML 생성 
 */
public class createJDOMXML {

	public static void main(String[] args) {
		//1.XML문서 객체(Document) 생성
		Document doc = new Document(); //<?xml version="1.0" encoding="UTF-8"?>
		
		//2. 최상위 부모노드 생성
		Element rootNode = new Element("msgs"); //<msgs/>
		
		//3. 최상위 부모노드를 XML 문서 객체 추가
		doc.addContent(rootNode);
		
		//4. 자식 노드 생성
		Element msgNode = new Element("msg"); //<msgs><msg></msg></msgs>
		//자식 노드에 문자열 (String node) 추가
		msgNode.setText("오늘은 월요일 입니다.");//<msgs><msg>오늘은 월요일 입니다.</msg></msgs>
		//5. 자식 노드를 부모노드에 추가
		rootNode.addContent(msgNode);
		
		Element nameNode = new Element("name");
		
		nameNode.setText("이준원");
		
		rootNode.addContent(nameNode);
		
		//6. 생성된 객체를 출력
		// XMLOutputter xout = new XMLOutputter(Format.getCompactFormat()); //한줄
		// XMLOutputter xout = new XMLOutputter(Format.getRawFormat()); //한줄
		XMLOutputter xout = new XMLOutputter(Format.getPrettyFormat()); //줄 바꿈
		
		try {
			xout.output(doc, System.out);
			FileOutputStream fos =
			new FileOutputStream("C:/dev/workspace/jsp_prj/src/main/webapp/xml1215/msg.xml");
			xout.output(doc, fos);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}//main

}//class
