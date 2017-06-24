<html><body bgcolor="asdf">
<h1>Please provide following information  </h1>
<form action="reguser2.jsp">
<table>
<tr>
   <td>Login Name </td>
   <td><input  type="text" name="logname" value="<%= request.getParameter("z1") %>" readonly="true"></td>
   <td> </td>
   <td>Full Name </td>
   <td><input  type="text" name="name"  > </td>
</tr>

<tr>
   <td>Password </td>
   <td><input  type="password" name="pwd" ></td>
   <td> </td>
   <td>Confirm Password </td>
   <td><input  type="password" name="pwd1"  > </td>
</tr>

<tr>
   <td>Father's Name </td>
   <td><input  type="text" name="fname" ></td>
   <td> </td>
   <td>Date of Birth </td>
   <td><input  type="Date" name="dob"  > </td>
</tr>

<tr>
   <td>Gender</td>
   <td><input  type="radio" name="gender" value="Male" > Male <input  type="radio" name="gender" value="Female" > Female </td>
   <td> </td>
   <td>Marital Status </td>
   <td> <input  type="radio" name="mstatus" value="Married" > Married <input  type="radio" name="mstatus" value="Single" >Single </td>
</tr>

<tr>
   <td>EMail ID </td>
   <td><input  type="email" name="mail" ></td>
   <td> </td>
   <td>Mobile No. </td>
   <td><input  type="text" name="phone"  > </td>
</tr>

<tr>
   <td>Highest Education </td>
   <td><input  type="text" name="edu" ></td>
   <td> </td>
   <td>Current Address </td>
   <td><textarea name="curradd" rows="6" cols="34" > </textarea> </td>
</tr>

<tr>
   <td>Security Question </td>
   <td><select name="secques">
        <option value="What is my Pets name">What is my Pets name</option>
        <option value="What is my mothers name">What is my mothers name</option>
        <option value="Where is my birth place">Where is my birth place</option>
    </select></td>
   <td> </td>
   <td>Security Answer </td>
   <td><input  type="text" name="secans"  > </td>
</tr>

<tr>
   <td colspan="5" align="center"> <input type="submit" value="Submit">  <input type="reset" value="Reset"> </td>
</tr>

</table>
</form>
</body></html>
 