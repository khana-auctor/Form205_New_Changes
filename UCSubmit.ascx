<%@ Control Language="vb" MaintainScrollPositionOnPostback="true"  AutoEventWireup="false" CodeBehind="UCSubmit.ascx.vb" Inherits="DOTForm0205.UCSubmit" %>
<%@ Register Src="UCMessageBox.ascx" TagName="UCMessageBox" TagPrefix="uc1" %>
<script src="FormScripts.js" type="text/javascript"></script>
<link href="Content/themes/base/UserControlStyle.css" rel="stylesheet" type="text/css" />
<style type="text/css">
  .auto-style-body {
    width: 884px;
    /*height: 66px;*/
  }

  .aerial-font {
    font-family: Arial;
    FONT-SIZE: 9px;
  }

  .aerial-font-small {
    font-family: Arial;
    FONT-SIZE: small;
  }
</style>

<asp:Panel ID="SubmitSection" runat="server" Width="884" Height="10px">
  <div class="auto-style-body" style="text-align: center;">
    <uc1:UCMessageBox ID="UCMessageBox1" runat="server" Visible="false" />
  </div>
  <div style="border: none;">
    <asp:Label ID="lblmover" runat="server" Width="300">&nbsp;</asp:Label>
    <asp:TextBox ID="ConsultAction" runat="server" CssClass="aerial-font-small" Width="157px" ReadOnly="true"
      Visible="false">Return</asp:TextBox>
    <asp:DropDownList ID="ReviewAction" runat="server" AutoPostBack="True" CssClass="aerial-font ie-edge-dropdown"
      Height="24px" Style="font-family: Arial; font-size: small" tabindex="198" Width="157px">
      <asp:ListItem>Proceed</asp:ListItem>
      <asp:ListItem>Save</asp:ListItem>
      <asp:ListItem>Cancel</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="SubmitButton" runat="server" Height="24px" CssClass="ie-edge-button" 
      Text="Submit" Width="74px" />
  </div>
  <div>
    <asp:Label ID="lblmover2" runat="server" Width="212">&nbsp;</asp:Label>
<%--    <asp:TextBox ID="ConsultAction" runat="server" CssClass="aerial-font-small" Width="157px" ReadOnly="true"
      Visible="false">Return</asp:TextBox>--%>
    <asp:TextBox ID="lblConsultUser" runat="server" BorderStyle="None" CssClass="aerial-font-small"
          Visible="false" ReadOnly="true" Width="73px">Select User</asp:TextBox>
    &nbsp;
    <asp:DropDownList ID="drpConsultUser" runat="server" CssClass="aerial-font-small ie-edge-dropdown" AutoPostBack="true"
      Visible="false" Width="235px" >
    </asp:DropDownList>
    <Br /><Br /><Br /><Br /><Br /><Br />
  </div>
</asp:Panel>

