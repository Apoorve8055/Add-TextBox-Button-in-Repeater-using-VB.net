<%@ Page Language="VB" AutoEventWireup="false" CodeFile="VB.aspx.vb" Inherits="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
        }
        table th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <asp:Repeater ID="rptCustomers" runat="server">
        <HeaderTemplate>
            <table cellspacing="0" rules="all" border="1">
                <tr>
                    <th scope="col" style="width: 80px">
                        User
                    </th>
                
                    <th scope="col" style="width: 120px">
                        pass
                    </th>

                    </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr> 
            <td>
               <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("user") %>' />
                </td>

                <td>
                    <asp:Label ID="txtCountry" runat="server" Text='<%# Eval("pass") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
        <tr>
                <td>
                    <asp:TextBox ID="lblCustomerId" runat="server" Text='<%# Eval("user") %>' />
                </td>

                <td>
                    <asp:TextBox ID="txtCountry" runat="server" Text='<%# Eval("pass") %>' />
                </td>

            </tr>
            <tr>
            <td colspan="2">         
            <asp:Button ID="Button1" runat="server" Text="Add User" OnClick="GetValue" Width="100%" />
</td>
            </tr>
            </table>
        </FooterTemplate>
       
    </asp:Repeater>

    </form>
</body>
</html>
