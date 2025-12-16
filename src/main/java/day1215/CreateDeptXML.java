package day1215;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import kr.co.sist.emp.DeptDTO;

public class CreateDeptXML {

	public void createXml(List<DeptDTO> list, JspWriter out) throws IOException{
		//1. XML문서 객체 생성
		Document doc = new Document();
		//2. 최상위 부모노드 생성
		Element deptsNode = new Element("depts");
		doc.addContent(deptsNode);
		
		//3. 자식 노드 생성
		Element deptNode = null;
		Element deptNoNode = null;
		Element dnameNode = null;
		//노드 값 설정 
		for(DeptDTO dDTO : list) {
			deptNode = new Element("dept");
			deptNoNode = new Element("deptno");
			dnameNode = new Element("dnameNode");
			//생성된 자식 노드를 자식 노드중 부모노드에 배치
			deptNoNode.setText(String.valueOf(dDTO.getDeptno()) );
			dnameNode.setText(dDTO.getDname());
			
			deptNode.addContent(deptNoNode);
			deptNode.addContent(dnameNode);
			//자식을 가진 부모 노드를 최상위 부모 노드에 배치
			deptsNode.addContent(deptNode);
		}//end for
		
		
		//6. 생성된 객체 출력
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
		xOut.output(doc, System.out);
		FileOutputStream fos = new FileOutputStream("C:/dev/workspace/jsp_prj/src/main/webapp/xml1215/deptInfo.xml");
		xOut.output(doc, fos ); // 파일로 출력
		xOut.output(doc, out);
		if(fos!=null) {fos.close();}//end if
	}//createXml

} // class
