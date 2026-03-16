<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCHeader.ascx.vb" Inherits="DOTForm0205.UCHeader" %>
<%@ Register Src="UCMessageBox.ascx" TagName="UCMessageBox" TagPrefix="uc1" %>
<script src="FormScripts.js" type="text/javascript"></script>

<link href="Content/themes/base/UserControlStyle.css" rel="stylesheet" type="text/css" />
<style type="text/css">
          .disable[disabled='disabled'] {
              color: black;
          }

          .style1 {
              width: 423px;
          }

          .style2 {
              text-align: center;
          }

          .style3 {
              width: 262px;
          }

          .style4 {
              width: 116px;
          }
      </style>

<asp:HiddenField ID="mouseLoc" runat="server" />
<asp:Label ID="lblJavaScript2" runat="server" value="<script type='text/javascript'>PreventBackspace();</script>"></asp:Label>

<div style="display: flex; align-items: center; gap: 8px; font-family: Verdana; font-size: 12px; flex-wrap: nowrap;">
    <label for="CurrentTaskName" style="white-space: nowrap;">
        Workflow Task:</label>
    <asp:TextBox ID="CurrentTaskName" runat="server" TabIndex="-1" CssClass="disable " Enabled="false" ReadOnly="true" Style="border: none;"
        AutoPostBack="true" Width="240" Text=""></asp:TextBox>
    <asp:Button ID="MessagesButton" runat="server" CssClass="ie-edge-button" TabIndex="-1" Text="Messages" Width="100" UseSubmitBehavior="false" />
    <asp:Button ID="ReleaseButton" BackColor="Yellow" runat="server" CssClass="ie-edge-button-yellow" TabIndex="-1" Text="Release" Width="120" UseSubmitBehavior="false" />
    <asp:Button ID="cmdPrintPreview" runat="server" CssClass="ie-edge-button" TabIndex="-1" Text="Print Preview" UseSubmitBehavior="false"  OnClientClick="if (document.activeElement) { try { document.activeElement.blur(); } catch(e){} } this.form.target='_blank'; setTimeout(function(){ document.forms[0].target='_self'; }, 500);" />
    <asp:Label Width="120" ID="lblref" Style="text-align: right; white-space: nowrap;" runat="server">Reference ID:</asp:Label>
    <asp:TextBox ID="ReferenceId" runat="server" TabIndex="-1" CssClass="disable " Enabled="false" ReadOnly="true" TextMode="SingleLine" Width="81px" Style="border: none;"
        Text=""></asp:TextBox>

</div>
<div style="clear: both; display: block;">
    <uc1:ucmessagebox id="UCMessageBox1" runat="server" visible="false" />
</div>
