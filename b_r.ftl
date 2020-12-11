<table width="100%" border="0" cellspacing="0" cellpadding="0"  style="font-size:18px;">
     <tr>
        <td width="35%">${inputdate?string("yyyy年MM月dd日 HH时mm分")}</td>
        <td width="40%" align="center"></td>
        <td width="25%"></td>
      </tr>
     <tr>
        <td  colspan="3"><div contenteditable="${canEdit}">${dailynotes}</div></td>
      </tr>
    </tr>  
         <tr>
        <td></td>
     
        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;医生签名：${signdoctorname}</td>
      </tr>  
    </table>  