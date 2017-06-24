import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class UploadServlet3 extends HttpServlet{ 
     public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
     response.setContentType("text/html");
     PrintWriter out = response.getWriter();
     String res="", ty="";
try{
    String saveFile="";
    String contentType = request.getContentType();
    if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
    DataInputStream in = new DataInputStream(request.getInputStream());
    int formDataLength = request.getContentLength();
    byte dataBytes[] = new byte[formDataLength];
    int byteRead = 0;
    int totalBytesRead = 0;
     while(totalBytesRead < formDataLength){
        byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
        totalBytesRead += byteRead;
    }
    String file = new String(dataBytes);
    saveFile = file.substring(file.indexOf("filename=\"") + 10);
    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
    saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
    int lastIndex = contentType.lastIndexOf("=");
    String boundary = contentType.substring(lastIndex + 1,contentType.length());
    int pos;
    pos = file.indexOf("filename=\"");
    pos = file.indexOf("\n", pos) + 1;
    pos = file.indexOf("\n", pos) + 1;
    pos = file.indexOf("\n", pos) + 1;
    int boundaryLocation = file.indexOf(boundary, pos) - 4;
    int startPos = ((file.substring(0, pos)).getBytes()).length;
    int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

   HttpSession ss= request.getSession();
   String nid=(String) ss.getAttribute("notice");
   ty=(String)ss.getAttribute("type");
   saveFile = nid + saveFile.substring(saveFile.lastIndexOf('.'));
  
String zz=".//webapps//stdash//images//notice//"+saveFile;
System.out.println(zz);
/* saveFile holding the image/video filename, now get the index of . from savefile -> use this value  to substring from savefile to get extention. then attach the vname, imgname from database table with the extention. now this new file name must be stored in saveFile and  in database*/
//  out.println(zz);   
    File ff = new File(zz);
    FileOutputStream fileOut = new FileOutputStream(ff);
    fileOut.write(dataBytes, startPos, (endPos - startPos));
    fileOut.flush();
    fileOut.close();
 //   out.println("You have successfully upload the file:"+saveFile);
  
    Connection con = null;
    String connectionURL = "jdbc:mysql://localhost/stdash";
    ResultSet rs = null;
    Statement st = null;
  
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    con = DriverManager.getConnection(connectionURL, "root", "");
    st = con.createStatement();
    String qry="update  notice set  image='"+saveFile+"'  where nid='"+nid+"'";
    System.out.println(qry);
    int s = st.executeUpdate(qry);
 if(s>0){
            res="ok";
            System.out.println("Uploaded successfully !");
    }else{
           res="error";
           System.out.println("Error!");
    }
    con.close();
}
}catch(Exception e){      System.out.print(e);         }
 RequestDispatcher rd = null;
  if(ty.equalsIgnoreCase("Faculty")){
         rd = request.getRequestDispatcher("./tnotice2.jsp");
   }else {
        rd = request.getRequestDispatcher("./anotice2.jsp");
  }
    request.setAttribute("res",res);
    rd.forward(request, response);
}};