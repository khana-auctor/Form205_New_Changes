<%@ Page Language="vb" AutoEventWireup="false" MaintainScrollPositionOnPostback="true" CodeBehind="view1.aspx.vb" Inherits="DOTForm0205.view1" %>

<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Src="UCSignatures.ascx" TagName="UCSignatures" TagPrefix="uc2" %>
<%@ Register Src="UCHeader.ascx" TagName="UCHeader" TagPrefix="uc3" %>
<%@ Register Src="UCAttachments.ascx" TagName="UCAttachments" TagPrefix="uc4" %>
<%@ Register Src="UCSubmit.ascx" TagName="UCSubmit" TagPrefix="uc5" %>

<link href="Content/themes/base/view1Style.css" rel="stylesheet" type="text/css" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title>DOTForm0205</title>
    <link href="~/Content/themes/base/jquery-ui.min.css" rel="stylesheet" />
    <link href="~/Content/themes/base/theme.css" rel="stylesheet" />

    <link href="content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.12.1.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.autosize.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script>
    <script src="FormScripts.js" type="text/javascript"></script>

    <style type="text/css">
        .disable[disabled='disabled'] {
            color: black;
        }

        .underline {
            border: 0;
            border-bottom: solid 1px #000;
            outline: none;
        }

        .normal {
            resize: none;
            font-family: Verdana;
            font-size: 13px;
            -webkit-transition: height 0.2s;
        }

        .height60 {
            height: 100px;
            font-family: Verdana;
            font-size: 13px;
        }

        .height50 {
            height: 50px;
            font-family: Verdana;
            font-size: 13px;
        }

        .form-body {
            width: 884px;
            font-family: Verdana;
            font-size: 13px;
            vertical-align: top;
        }

        .form-body-section {
            width: 884px;
            font-family: Verdana;
            font-size: 13px;
        }

        .radionbuttonlist {
            font-family: Verdana;
            font-size: 12px;
            display: inline-block;
            text-align: left;
        }

        .checkbox {
            font-family: Verdana;
            font-size: 12px;
            display: inline-block;
            vertical-align: middle;
        }

        .css-wrap {
            white-space: pre-wrap;
            vertical-align: top;
            font-family: Verdana;
            font-size: 13px;
        }

        .aerial-font-small {
            font-family: Arial;
            font-size: 7px;
        }

        .OverlapedDiv {
            position: absolute;
            left: 375px;
        }

        .animated {
            -webkit-transition: height 0.2s;
            transition: height 0.2s;
            font-family: Verdana;
            font-size: 13px;
        }

        .auto-style9 {
            width: 26px;
        }

        .auto-style10 {
            width: 784px;
        }

        .auto-style11 {
            width: 603px;
            table-layout: fixed;
        }

        .auto-style12 {
            width: 414px;
        }

        .auto-style14 {
            width: 743px;
            table-layout: fixed;
        }

        .auto-style15 {
            width: 85px;
        }

        .auto-style16 {
            width: 742px;
            table-layout: fixed;
        }

        .auto-style19 {
            margin-left: 36px;
            margin-top: 0px;
        }

        .auto-style21 {
            width: 606px;
            table-layout: fixed;
        }

        .auto-style23 {
            width: 31px;
        }

        .auto-style24 {
            margin-left: 42px;
        }

        .auto-style26 {
            width: 38px;
        }

        .auto-style27 {
            width: 36px;
        }

        .auto-style30 {
            height: 21px;
        }

        .auto-style33 {
            width: 625px;
        }

        .auto-style34 {
            width: 52px;
        }

        .auto-style36 {
            width: 561px;
        }

        .auto-style41 {
            height: 24px;
        }

        .auto-style42 {
            height: 22px;
            font-family: Verdana;
            font-size: 10pt;
        }

        .auto-style43 {
            height: 25px;
        }

        .auto-style45 {
            height: 93px;
        }

        .auto-style46 {
            width: 624px;
            table-layout: fixed;
            margin-top: 0px;
        }

        .auto-style47 {
            margin-left: 70px;
        }

        .auto-style50 {
            width: 33px;
        }

        .auto-style51 {
            width: 696px;
            height: 33px;
        }

        .auto-style52 {
            width: 707px;
            table-layout: fixed;
            height: 531px;
        }

        .auto-style58 {
            width: 244px;
        }

        .auto-style59 {
            width: 213px;
        }

        .auto-style60 {
            width: 176px;
        }

        .auto-style63 {
            width: 665px;
            font-family: Verdana;
            font-size: 12pt;
        }

        .auto-style64 {
            width: 178px;
            height: 26px;
        }

        .auto-style68 {
            height: 29px;
        }

        .auto-style73 {
            width: 732px;
        }

        .auto-style74 {
            width: 103px;
        }

        .auto-style75 {
            width: 682px;
        }

        .auto-style76 {
            width: 587px;
        }

        .auto-style77 {
            width: 104px;
        }

        .auto-style78 {
            height: 82px;
        }

        .auto-style79 {
            overflow: auto;
        }

        .auto-style80 {
            width: 213px;
            height: 24px;
        }

        .auto-style81 {
            width: 105px;
        }

        .auto-style83 {
            width: 624px;
            table-layout: fixed;
        }

        .auto-style88 {
            height: 16px;
        }

        .auto-style89 {
            width: 69px;
            height: 62px;
        }

        .auto-style90 {
            height: 62px;
        }

        .auto-style91 {
            width: 26px;
            height: 62px;
        }

        .auto-style92 {
            height: 32px;
        }

        .auto-style93 {
            height: 43px;
        }

        .auto-style94 {
            margin-bottom: 15px;
        }

        .auto-style95 {
            width: 173px;
        }

        .auto-style96 {
            width: 106px;
        }

        .auto-style97 {
            width: 107px;
        }

        .auto-style98 {
            width: 153px;
        }

        .auto-style99 {
            width: 594px;
            table-layout: fixed;
        }

        .auto-style100 {
            width: 616px;
        }

        .auto-style101 {
            height: 34px;
        }

        .auto-style104 {
            width: 100px;
            height: 162px;
        }

        .auto-style106 {
            width: 120px;
        }

        .auto-style108 {
            width: 100px;
        }

        .auto-style109 {
            width: 41px;
        }

        .auto-style110 {
            height: 21px;
            width: 41px;
        }

        .auto-style111 {
            width: 41px;
            height: 34px;
        }

        .auto-style112 {
            width: 85px;
            height: 18px;
        }

        .auto-style113 {
            width: 103px;
            height: 18px;
        }

        .auto-style114 {
            height: 18px;
        }

        .auto-style115 {
            width: 692px;
            height: 27px;
        }

        .auto-style116 {
            height: 19px;
        }

        .auto-style117 {
            height: 59px;
        }

        .auto-style118 {
            height: 53px;
        }

        .auto-style119 {
            height: 69px;
        }

        .auto-style120 {
            height: 36px;
        }

        .auto-style121 {
            height: 66px;
        }

        .auto-style122 {
            height: 35px;
        }

        .auto-style123 {
            height: 37px;
        }

        .auto-style124 {
            height: 50px;
        }

        .auto-style125 {
            width: 616px;
            table-layout: fixed;
            height: 176px;
        }

        .auto-style126 {
            height: 98px;
        }

        .auto-style127 {
            height: 17px;
        }

        .auto-style128 {
            width: 699px;
            table-layout: fixed;
        }

        .auto-style130 {
            width: 69px;
        }

        .auto-style131 {
            height: 66px;
            width: 595px;
        }

        .auto-style139 {
            width: 899px;
        }

        .auto-style141 {
            width: 811px;
        }

        .auto-style142 {
            width: 817px;
        }

        .auto-style143 {
            width: 859px;
        }

        .auto-style144 {
            width: 815px;
        }

        .auto-style145 {
            width: 813px;
        }

        .auto-style146 {
            width: 782px;
        }

        .auto-style147 {
            font-size: small;
        }

        .auto-style148 {
            width: 182px;
            height: 17px;
        }

        .auto-style149 {
            height: 27px;
        }

        .auto-style151 {
            width: 100%;
        }

        .auto-style152 {
            width: 96%;
        }
    </style>
</head>
<body>
    <form id="view1" runat="server" onclientclick="myMouseClick" visible="true" style="margin-left: 100px">
        <asp:ScriptManager ID="ScriptManager1"
            runat="server"
            EnablePartialRendering="true"
            EnableHistory="false" />

        <asp:HiddenField ID="inpHide" runat="server" />
        <asp:HiddenField ID="isFormLocked" runat="server" />
        <asp:HiddenField ID="XMLFileLoc" runat="server" />
        <asp:HiddenField ID="mouseLoc" runat="server" />
        <asp:HiddenField ID="setScrolltoTop" runat="server" />
        <asp:HiddenField ID="scrollField" runat="server" />
        <asp:HiddenField ID="isValidate" runat="server" />
        <asp:HiddenField ID="hfAttendanceData" runat="server" />
        <asp:HiddenField ID="hfUtilityData" runat="server" />
        <asp:HiddenField ID="div_position" runat="server" Value="0" />
        <asp:HiddenField ID="isInitialLoad" runat="server" Value="true" />
        <asp:HiddenField ID="hfFormInstance" runat="server" />
        <asp:HiddenField ID="hfTabToReviewAction" runat="server" Value="0" ClientIDMode="Static" />
        <asp:Button ID="F8Pressed" runat="server" OnClick="SaveXMLForDebug" Style="display: none;" />
        <asp:Button ID="F9Pressed" runat="server" OnClick="SaveXMLFromFile" Style="display: none;" />
        <asp:Label ID="lblJavaScript" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblJavaScript2" runat="server" Text="<script type='text/javascript'>PreventBackspace();</script>"></asp:Label>
        <asp:Panel ID="pnlUCHeader" runat="server">
            <div align="center" style="width: 888px">
                <uc3:UCHeader ID="UCHeader1" runat="server" Visible="true" />
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlMP" TabIndex="1" runat="server" Style="font-family: Verdana;">
            <div>
                <asp:Panel ID="pnlMainPage" runat="server">
                    <div>
                        <table border="0" class="auto-style52" style="font-weight: normal; font-size: 10pt">
                            <colgroup>
                                <col />
                                <col style="width: 120px" />
                                <col style="width: 634px" />
                                <col style="width: 4px" />
                            </colgroup>
                            <tbody valign="top">
                                <tr>
                                    <td class="auto-style104">
                                        <div align="center" class="auto-style75">
                                            <strong><font size="3">Kansas Department of Transportation</font> </strong>
                                        </div>
                                        <div align="center" class="auto-style75">
                                            <strong><font size="4">PRECONSTRUCTION CONFERENCE</font> </strong>
                                        </div>
                                        <div align="left">
                                        </div>
                                        <div align="left">
                                        </div>
                                        <div align="left">
                                            <table border="0" class="" style="width: 670px; table-layout: fixed;">
                                                <colgroup>
                                                    <col style="width: 95px" />
                                                    <col style="width: 575px" />
                                                </colgroup>
                                                <tbody valign="top">
                                                    <tr style="min-height: 51px">
                                                        <td>
                                                            <div>
                                                                <font size="2">MEMO TO:</font>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div>
                                                                <font size="2">
                                                                    <asp:TextBox ID="txtDistrictEngineer" runat="server" AutoPostBack="false" CssClass="disable" Enabled="false" TabIndex="1" TextMode="SingleLine"></asp:TextBox>
                                                                </font>
                                                            </div>
                                                            <div class="sig-label">
                                                                District Engineer
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr style="min-height: 51px">
                                                        <td>
                                                            <div>
                                                                <font size="2">FROM:</font>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div>
                                                                <font size="2">
                                                                    <asp:TextBox ID="txtAreaEngineer" runat="server" AutoPostBack="false" Enabled="false" CssClass="disable" ReadOnly="true" TabIndex="2" TextMode="SingleLine"></asp:TextBox>
                                                                </font>
                                                            </div>
                                                            <div class="sig-label">
                                                                Area Engineer
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <tr style="min-height: 20px">
                                            <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px; width: 100px;">
                                                <div>
                                                    <font size="2"></font>
                                                </div>
                                            </td>
                                            <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px; width: 120px;">
                                                <div>
                                                    <font size="2">OFFICE:</font>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-container" style="vertical-align: bottom;">
                                                    <asp:TextBox ID="txtOffice" runat="server" CssClass="disable textbox-with-clear" TabIndex="3" TextMode="SingleLine" Width="485px" AutoPostBack="false" onchange="javascript: CheckTextBox(this,'Office is required.');"></asp:TextBox>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="min-height: 26px">
                                            <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style108">
                                                <div>
                                                    <font size="2"></font>
                                                </div>
                                            </td>
                                            <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style106">
                                                <div>
                                                    <font size="2">DATE:</font>
                                                </div>
                                            </td>
                                            <td>
                                                <div style="vertical-align: bottom;">
                                                    <asp:TextBox ID="dteMtgDate" runat="server" onchange="javascript:CheckScrollPosition(this);" AutoPostBack="true" onkeydown="return ((event.keyCode>=48 && event.keyCode<=57) || (event.keyCode>=96 && event.keyCode<=105) || event.keyCode==9 || event.keyCode==13 || event.keyCode==111 || event.keyCode==191 || event.keyCode==8);" CssClass="disable" TabIndex="4"></asp:TextBox>
                                                </div>
                                            </td>
                                        </tr>
                                    </td>
                                </tr>
                                <tr style="min-height: 25px">
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style108">
                                        <div>
                                            <font size="2"></font>
                                        </div>
                                    </td>
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style106">
                                        <div>
                                            <font size="2">TIME:</font>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="vertical-align: bottom;">
                                            <asp:TextBox ID="dteMtgTime" runat="server" onchange="javascript:CheckScrollPosition(this);" AutoPostBack="true" onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90) || (event.keyCode==80 || event.keyCode==65 || event.keyCode==77));" CssClass="disable" TabIndex="5" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 25px">
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style108">
                                        <div>
                                            <font size="2"></font>
                                        </div>
                                    </td>
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style106">
                                        <div>
                                            <font size="2">LOCATION:</font>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="vertical-align: bottom;">
                                            <asp:TextBox ID="txtLocation" runat="server" onchange="javascript: CheckTextBox(this,'Location is required.');" AutoPostBack="false"
                                                Style="overflow: hidden; resize: none;" CssClass="disable no-autosize" TabIndex="6"
                                                TextMode="MultiLine" Width="485px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 26px">
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style108">
                                        <div>
                                            <font size="2"></font>
                                        </div>
                                    </td>
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style106">
                                        <div>
                                            <font size="2">CONTRACT No:</font>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="vertical-align: bottom;">
                                            <asp:TextBox ID="ContractNumber" onchange="javascript:CheckScrollPosition(this);"
                                                onkeydown="return ((event.keyCode>=48 && event.keyCode<=57) || (event.keyCode>=96 && event.keyCode<=105) || event.keyCode==9 || event.keyCode==13 || event.keyCode==8 || event.ctrlKey);"
                                                runat="server" AutoPostBack="true" CssClass="disable" MaxLength="9" TabIndex="7" TextMode="SingleLine">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style108">
                                        <div>
                                            <font size="2"></font>
                                        </div>
                                    </td>
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style106">
                                        <div>
                                            <font size="2">FEDERAL No:</font>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="vertical-align: bottom;">
                                            <asp:TextBox ID="FedProjectNumber" runat="server" onchange="javascript: CheckTextBox(this,'Location is required.');" AutoPostBack="false" Enabled="false" CssClass="disable" ReadOnly="true" TabIndex="8" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 25px">
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style108">
                                        <div>
                                            <font size="2"></font>
                                        </div>
                                    </td>
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style106">
                                        <div>
                                            <font size="2">PROJECT No:</font>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="vertical-align: bottom;">
                                            <asp:TextBox ID="txtRoute" runat="server" AutoPostBack="false" CssClass="disable" Enabled="false" TabIndex="9" TextMode="SingleLine" Width="37px"></asp:TextBox>
                                            -<asp:TextBox ID="txtCountyNumber" runat="server" AutoPostBack="false" CssClass="disable" Enabled="false" TabIndex="10" TextMode="SingleLine" Width="30px"></asp:TextBox>
                                            &nbsp;<asp:TextBox ID="ProjectNumber" runat="server" AutoPostBack="false" CssClass="disable" Enabled="false" TabIndex="11" TextMode="SingleLine" Width="80px"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style108">
                                        <div>
                                            <font size="2"></font>
                                        </div>
                                    </td>
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style106">
                                        <div>
                                            <font size="2">COUNTY:</font>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="vertical-align: bottom;">
                                            <asp:TextBox ID="txtCounty" runat="server" onchange="javascript:CheckScrollPosition(this);" AutoPostBack="true" CssClass="disable" Enabled="false" TabIndex="12" TextMode="SingleLine" Width="200px"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div align="right">
                                            <font size="2">TYPE OF CONSTRUCTION:</font>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="vertical-align: bottom;">
                                            <asp:TextBox ID="txtConstType" runat="server" AutoPostBack="false" Enabled="false" CssClass="disable" TabIndex="13"
                                                TextMode="SingleLine" Width="485px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style108">
                                        <div>
                                            <font size="2"></font>
                                        </div>
                                    </td>
                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style106">
                                        <div>
                                            <font size="2">CONTRACTOR:</font>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="vertical-align: bottom;">
                                            <asp:TextBox ID="txtContractorName" runat="server" AutoPostBack="false" Enabled="false" CssClass="disable" TabIndex="14"
                                                TextMode="SingleLine" Width="485px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: bottom; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style108">
                                        <div>
                                            <font size="2"></font>
                                        </div>
                                    </td>
                                    <td style="vertical-align: bottom; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style106">
                                        <div>
                                            <font size="2"></font>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <font size="2"></font>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="vertical-align: top;">
                                        <div>
                                            <font size="2">Additional cc&#39;s to include:</font>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <asp:GridView ID="grdCC" runat="server" AutoGenerateColumns="false" TabIndex="15" ShowHeader="False" Height="22px">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <div class="clearable" style="font-family: Verdana; font-size: 10pt;">
                                                                <asp:TextBox ID="txtAdditionalCC" runat="server" AutoPostBack="false" BorderStyle="None" OnTextChanged="SaveCC" onchange="javascript: validateEmail(this);" CssClass="disable visible-input" TabIndex="15" TextMode="SingleLine" Width="491px"></asp:TextBox>
                                                                <button type="button" class="clear-btn" tabindex="-1" aria-label="Clear">&times;</button>

                                                            </div>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="493px" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <div class="optionalPlaceholder" style="width: 493px">
                                                <asp:Button runat="server" ID="addCC" Text="Insert an additional person to include on cc" Width="274px" TabIndex="-1" OnClientClick="CheckScrollPosition(this) " CssClass="ie-upload-button" />
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 26px">
                                    <td colspan="3" style="vertical-align: top; padding-bottom: 1px; border-bottom-color: ; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div>
                                            <font size="2"></font>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div align="center" class="auto-style73">
                        <strong><font style="font-family: Verdana; font-weight: 600; font-size: 12pt;">ATTENDANCE</font> </strong>
                    </div>
                    <div>
                        <asp:Panel ID="AttendenceSection" runat="server" Visible="true" Width="855px">
                            <div align="left">
                                <div>
                                    <asp:GridView ID="grdAttendance" runat="server" AutoGenerateColumns="false" CssClass="compact-grid" HeaderStyle-BackColor="#cbd8eb" Style="font-weight: normal; font-size: 10pt; border-collapse: collapse !important; table-layout: fixed !important;">
                                        <Columns>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="LineItemAttendence" Rows="1" Text='<%# Bind("LineItemAttendence") %>' runat="server" TabIndex="-1" TextMode="Multiline" CssClass="disable"
                                                        ReadOnly="true" BorderStyle="None" Width="24px" Style="resize: none;">
                                                    </asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle Width="26px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="AttendeeName" Rows="1" Text='<%# Bind("AttendeeName") %>' runat="server" AutoPostBack="false" CssClass="disable allow-grow" TabIndex="0"
                                                        TextMode="Multiline" BorderStyle="None" Width="166px" Style="resize: none;">
                                                    </asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle Width="168px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Business Telephone">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="BusinessPhone" Rows="1" Text='<%# Bind("BusinessPhone") %>' runat="server" AutoPostBack="false" CssClass="disable allow-grow" MaxLength="14" TabIndex="0"
                                                        TextMode="Multiline" BorderStyle="None" Width="106px" onchange="javascript:formatPhone(this);" Style="resize: none;">
                                                    </asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cell Telephone">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="CellPhone" Rows="1" Text='<%# Bind("CellPhone") %>' runat="server" AutoPostBack="false" CssClass="disable allow-grow" MaxLength="14" TabIndex="0"
                                                        TextMode="Multiline" BorderStyle="None" Width="106px" onchange="javascript:formatPhone(this);" Style="resize: none;">
                                                    </asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Company or Organization">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="AttendeeOrg" Rows="1" Text='<%# Bind("AttendeeOrg") %>' runat="server" AutoPostBack="false" CssClass="disable allow-grow" TabIndex="0"
                                                        TextMode="Multiline" BorderStyle="None" Width="165px" Style="resize: none;">
                                                    </asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle Width="167px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email Address">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="emailaddress" Rows="1" Text='<%# Bind("emailaddress") %>' runat="server" AutoPostBack="false" onchange="javascript: validateEmail(this);" CssClass="disable allow-grow"
                                                        TabIndex="0" TextMode="Multiline" Style="overflow: auto; resize: none;" BorderStyle="None" Width="146px">
                                                    </asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <div style="width: 697px">
                                        <asp:Button runat="server" Text="Add Attendee" OnClick="AddAttendee_Click" ID="AddAttendee" Height="22px" OnClientClick="CheckScrollPosition(this) " CssClass="ie-upload-button"></asp:Button>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                    <div align="left">
                        <asp:CheckBox runat="server" ID="blnShowAttendList" Visible="false" Text=" " Checked="True" />
                    </div>
                    <table border="0">
                        <colgroup>
                            <col style="width: 120px" />
                            <col style="width: 634px" />
                        </colgroup>
                        <tbody valign="top">
                            <tr>
                                <td class="auto-style148">
                                    <div class="auto-style147">
                                        <asp:Label ID="lblPicture" runat="server" Text="Browse to insert a picture." Visible="true"></asp:Label>
                                    </div>
                                </td>
                                <td class="auto-style127">
                                    <div>
                                        <!-- Hidden FileUpload control -->
                                        <asp:FileUpload ID="uplPicture" runat="server" onchange="javascript:CheckFileType(this);" Visible="true" accept=".tif,.tiff,.png,.jpg,.jpeg,.gif" Style="display: none;" />

                                        <!-- Custom Browse Button -->
                                        <asp:Button ID="btnBrowse" runat="server" Text="Choose File" CssClass="ie-upload-button" OnClientClick="triggerFileUpload(); return false;" UseSubmitBehavior="false" />

                                        <!-- Your existing Upload Button -->
                                        <asp:Button ID="btnUpload" runat="server" Text="Upload" Height="20px" OnClientClick="CheckScrollPosition(this);" CssClass="ie-upload-button" />
                                    </div>
                                </td>
                                <%-- <td class="auto-style127">
          <div>
            <asp:FileUpload ID="uplPicture" runat="server" Width="81px" onchange="javascript: CheckFileType(this);" Visible="true" Height="20px" accept=".tif,.tiff,.png,.jpg,.jpeg,.gif"/>
            <asp:Button ID="btnUpload" runat="server" Text="Upload" Height="20px" OnClientClick="CheckScrollPosition(this)" />
          </div>
        </td>--%>
                                <%--  <td class="auto-style127">
                  <div>
                    <asp:FileUpload ID="uplPicture" runat="server" Width="81px" onchange="javascript: CheckFileType(this);" Visible="true" Height="20px" accept=".tif,.tiff,.png,.jpg,.jpeg,.gif"/>
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" Height="20px" CssClass="ie-edge-button" OnClientClick="CheckScrollPosition(this)" />
                  </div>
                </td>--%>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete Image" CssClass="ie-upload-button" Height="20px" Visible="false" OnClientClick="CheckScrollPosition(this) " />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Image ID="picAttendees" runat="server" Visible="false" Width="813px" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div><font class="auto-style63" style="font-family: Verdana; font-weight: 400; font-size: 12pt;">I.<strong> Delegation of Authority</strong></font></div>
                    <div class="auto-style80 kdot-body-text">Contractor's Representatives</div>
                    <div>
                        <table class="auto-style16 ie-compact-table" style="border-collapse: collapse; border-spacing: 0px; font-weight: normal; font-size: 10pt" border="0" cellpadding="0" cellspacing="0">
                            <colgroup>
                                <col style="width: 81px" />
                                <col style="width: 98px" />
                                <col style="width: 150px" />
                                <col style="width: 102px" />
                                <col style="width: 102px" />
                                <col style="width: 165px" />
                            </colgroup>
                            <tbody valign="top">
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-right: #000000 1px solid; vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px; background-color: #cbd8eb">
                                        <div align="center">
                                            <strong />
                                        </div>
                                        <div align="center">
                                            <strong>Name</strong>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px; background-color: #cbd8eb">
                                        <div align="center">
                                            <strong>Business</strong>
                                        </div>
                                        <div align="center">
                                            <strong>Telephone</strong>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px; background-color: #cbd8eb">
                                        <div align="center">
                                            <strong>Cell</strong>
                                        </div>
                                        <div align="center">
                                            <strong>Telephone</strong>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px; background-color: #cbd8eb">
                                        <div align="center">
                                            <strong />
                                        </div>
                                        <div align="center">
                                            <strong>Email Address</strong>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="border-right: #000000 1px solid; vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style42">
                                        <div class="kdot-body-text">
                                            Project Superintendent:
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style149">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="18" TextMode="MultiLine" CssClass="disable allow-grow" ID="txtIC1ProjSuper"
                                                BorderStyle="None" Width="153px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style149">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="19" TextMode="MultiLine" CssClass="disable allow-grow" ID="txtIC1ProjSuperPhone"
                                                MaxLength="10" BorderStyle="None" Width="98px" onchange="javascript:formatPhone(this);" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style149">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="20" TextMode="MultiLine" CssClass="disable allow-grow"
                                                ID="txtIC1ProjSuperCell" MaxLength="10" BorderStyle="None" Width="99px" Style="overflow: auto; resize: none;"
                                                onchange="javascript:formatPhone(this);">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style149">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="21" TextMode="MultiLine" CssClass="disable allow-grow" Style="overflow: auto; resize: none;"
                                                ID="txtIC1ProjSuperOrg" onchange="javascript: validateEmail(this);" BorderStyle="None" Width="170px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="border-right: #000000 1px solid; vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style42">
                                        <div class="kdot-body-text">
                                            General Superintendent:
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="22" TextMode="MultiLine" CssClass="disable allow-grow" ID="txtIC1GenSuper"
                                                BorderStyle="None" Width="153px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="23" TextMode="MultiLine" CssClass="disable allow-grow"
                                                ID="txtIC1GenSuperPhone" BorderStyle="None" Width="98px" onchange="javascript:formatPhone(this);" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="24" TextMode="MultiLine" CssClass="disable allow-grow" Style="overflow: auto; resize: none;"
                                                ID="txtIC1GenSuperCell" BorderStyle="None" Width="99px" onchange="javascript:formatPhone(this);">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" AutoPostBack="false" TabIndex="25" TextMode="MultiLine" CssClass="disable allow-grow" Style="overflow: auto; resize: none;"
                                                ID="txtIC1GenSuperOrg" onchange="javascript: validateEmail(this);" BorderStyle="None" Width="170px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="border-right: #000000 1px solid; vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style42">
                                        <div class="kdot-body-text">
                                            Project Manager:
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="26" TextMode="MultiLine" CssClass="disable allow-grow" ID="txtIC1ProjMgr"
                                                BorderStyle="None" Width="153px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="27" TextMode="MultiLine" CssClass="disable allow-grow" Style="overflow: auto; resize: none;"
                                                ID="txtIC1ProjMgrPhone" MaxLength="10" BorderStyle="None" Width="98px" onchange="javascript:formatPhone(this);">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="28" TextMode="MultiLine" Style="overflow: auto; resize: none;"
                                                CssClass="disable allow-grow" ID="txtIC1ProjMgrCell" MaxLength="10" BorderStyle="None" Width="99px"
                                                onchange="javascript:formatPhone(this);">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="29" TextMode="MultiLine" onchange="javascript: validateEmail(this);"
                                                CssClass="disable allow-grow" ID="txtIC1ProjMgrOrg" BorderStyle="None" Width="170px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <br />
                    <div style="margin-bottom: 0px; margin-top: 0px">
                        <div class="auto-style64" style="font-family: Verdana; font-weight: 400; font-size: 10pt;">KDOT Representatives</div>
                    </div>
                    <div>
                        <table class="auto-style14 ie-compact-table" style="border-collapse: collapse; border-spacing: 0px; font-weight: normal; font-size: 10pt" border="0">
                            <colgroup>
                                <col />
                                <col style="width: 104px" />
                                <col style="width: 144px" />
                                <col style="width: 102px" />
                                <col style="width: 102px" />
                                <col style="width: 166px" />
                            </colgroup>
                            <tbody valign="top">
                                <tr>
                                    <td class="auto-style15">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-right: #000000 1px solid; vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style74">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px; background-color: #cbd8eb">
                                        <div align="center">
                                            <strong />
                                        </div>
                                        <div align="center" class="auto-style98">
                                            <strong>Name</strong>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px; background-color: #cbd8eb">
                                        <div align="center" class="auto-style97">
                                            <strong>Business Telephone</strong>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px; background-color: #cbd8eb">
                                        <div align="center" class="auto-style96">
                                            <strong>Cell</strong>
                                        </div>
                                        <div align="center" class="auto-style81">
                                            <strong>Telephone</strong>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px; background-color: #cbd8eb">
                                        <div align="center">
                                            <strong />
                                        </div>
                                        <div align="center" class="auto-style95">
                                            <strong>Email Address</strong>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="font-size: 10pt; font-weight: normal;" class="auto-style42">
                                        <div class="kdot-body-text">
                                            Construction Engineer:
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="30" TextMode="MultiLine" CssClass="disable allow-grow"
                                                ID="txtIC2ConstEng" BorderStyle="None" Width="147px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" AutoPostBack="false" Rows="1" TabIndex="31" TextMode="MultiLine" CssClass="disable allow-grow" Style="overflow: auto; resize: none;"
                                                ID="txtIC2ConstEngPhone" MaxLength="10" onchange="javascript:formatPhone(this);" BorderStyle="None" Width="100px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" AutoPostBack="false" Rows="1" TabIndex="32" TextMode="MultiLine" CssClass="disable allow-grow" Style="overflow: auto; resize: none;"
                                                ID="txtIC2ConstEngCell" MaxLength="10" onchange="javascript:formatPhone(this);" BorderStyle="None" Width="99px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" AutoPostBack="false" Rows="1" TabIndex="33" TextMode="MultiLine" CssClass="disable allow-grow" Style="overflow: auto; resize: none;"
                                                ID="txtIC2ConstEngEmail" onchange="javascript: validateEmail(this);" BorderStyle="None" Width="170px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 25px">
                                    <td colspan="2" style="font-size: 10pt; font-weight: normal;" class="auto-style42">
                                        <div class="kdot-body-text">
                                            Field Engineering Admin:
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="34" TextMode="MultiLine"
                                                CssClass="disable allow-grow" Style="overflow: auto; resize: none;" ID="txtFEAName" BorderStyle="None" Width="147px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="35" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" Style="overflow: auto; resize: none;" ID="txtFEAPhone" BorderStyle="None" Width="100px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="36" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" Style="overflow: auto; resize: none;" ID="txtFEACell" BorderStyle="None" Width="99px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="37" TextMode="MultiLine" onchange="javascript: validateEmail(this);"
                                                CssClass="disable allow-grow" Style="overflow: auto; resize: none;" ID="txtFEAEmail" BorderStyle="None" Width="170px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="font-size: 10pt; font-weight: normal;" class="auto-style42">
                                        <div class="kdot-body-text">
                                            Area Engineer:
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="38" TextMode="MultiLine"
                                                CssClass="disable allow-grow" ID="txtAreaEngineer2" BorderStyle="None" Width="147px" Style="margin-left: 0px; overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="39" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" ID="txtAreaEngPhone" BorderStyle="None" Width="100px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="40" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" ID="txtAreaEngCell" BorderStyle="None" Width="99px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="41" TextMode="MultiLine" onchange="javascript: validateEmail(this);"
                                                CssClass="disable allow-grow" ID="txtAreaEngEmail" BorderStyle="None" Width="170px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 22px">
                                    <td colspan="2" style="font-size: 10pt; font-weight: normal;" class="auto-style42">
                                        <div class="kdot-body-text">
                                            Project Supervisor:
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="42" TextMode="MultiLine" Style="overflow: auto; resize: none;"
                                                CssClass="disable allow-grow" ID="txtIC2ProjSuper" BorderStyle="None" Width="147px" Height="18px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="43" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" ID="txtIC2ProjSuperPhone" MaxLength="10" BorderStyle="None" Width="100px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="44" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" ID="txtIC2ProjSuperCell" MaxLength="10" BorderStyle="None" Width="99px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="45" TextMode="MultiLine" onchange="javascript: validateEmail(this);"
                                                CssClass="disable allow-grow" ID="txtIC2ProjSuperEmail" BorderStyle="None" Width="170px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="font-size: 10pt; font-weight: normal;" class="auto-style42">
                                        <div class="kdot-body-text">
                                            Project Inspector:
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="46" TextMode="MultiLine" Style="overflow: auto; resize: none;"
                                                CssClass="disable allow-grow" ID="txtIC2ProjInsp" BorderStyle="None" Width="147px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="47" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" ID="txtIC2ProjInspPhone" MaxLength="10" BorderStyle="None" Width="100px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="49" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" ID="txtIC2ProjInspCell" MaxLength="10" BorderStyle="None" Width="99px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="50" TextMode="MultiLine" onchange="javascript: validateEmail(this);"
                                                CssClass="disable allow-grow" ID="txtIC2ProjInspEmail" BorderStyle="None" Width="170px" Height="18px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="font-size: 10pt; font-weight: normal;" class="auto-style42">
                                        <div class="kdot-body-text">
                                            Eng. In Responsible Charge
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="51" TextMode="MultiLine" Style="overflow: auto; resize: none;"
                                                CssClass="disable allow-grow" ID="txtEircName" BorderStyle="None" Width="147px" Height="18px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="52" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" ID="txtEricPhone" BorderStyle="None" Width="100px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="53" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" ID="txtEricCell" BorderStyle="None" Width="99px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="54" TextMode="MultiLine" onchange="javascript: validateEmail(this);"
                                                CssClass="disable allow-grow" ID="txtEricEmail" BorderStyle="None" Width="170px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="font-size: 10pt; font-weight: normal;" class="auto-style42">
                                        <div class="kdot-body-text">
                                            Public Affairs Information:
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="55" TextMode="MultiLine" Style="overflow: auto; resize: none;"
                                                CssClass="disable allow-grow" ID="txtIC2PubAffInfo" BorderStyle="None" Width="147px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="56" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" ID="txtIC2PubAffPhone" MaxLength="10" BorderStyle="None" Width="100px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="57" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" ID="txtIC2PubAffInfoCell" MaxLength="10" BorderStyle="None" Width="99px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="58" TextMode="MultiLine" onchange="javascript: validateEmail(this);"
                                                CssClass="disable allow-grow" ID="txtIC2PubAffEmail" BorderStyle="None" Width="170px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="font-size: 10pt; font-weight: normal;" class="auto-style42">
                                        <div class="kdot-body-text">
                                            Emergency Information:
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="59" TextMode="MultiLine" Style="overflow: auto; resize: none;"
                                                CssClass="disable allow-grow" ID="txtIC2EmrgyContact" BorderStyle="None" Width="147px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="60" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" ID="txtIC2EmrgyPhone" MaxLength="10" BorderStyle="None" Width="100px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="61" TextMode="MultiLine" onchange="javascript:formatPhone(this);"
                                                CssClass="disable allow-grow" ID="txtIC2EmrgyCell" MaxLength="10" BorderStyle="None" Width="99px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px solid; vertical-align: top; border-bottom: #000000 1px solid; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px solid; padding-right: 1px" class="auto-style42">
                                        <div>
                                            <asp:TextBox runat="server" Rows="1" AutoPostBack="false" TabIndex="62" TextMode="MultiLine" onchange="javascript: validateEmail(this);"
                                                CssClass="disable allow-grow" ID="grpEmrgyInfoEmail" BorderStyle="None" Width="170px" Height="18px" Style="overflow: auto; resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style112">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-right: #000000 1px; vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style113">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px; vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px; padding-right: 1px" class="auto-style114">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px; vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px; padding-right: 1px" class="auto-style114">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px; vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px; padding-right: 1px" class="auto-style114">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-top: #000000 1px solid; border-right: #000000 1px; vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-left: #000000 1px; padding-right: 1px" class="auto-style114">
                                        <div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style15">
                                        <div>
                                        </div>
                                    </td>
                                    <td colspan="3" style="border-right-width: 1pt; vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-right-color: #000000; padding-right: 1px">
                                        <div class="kdot-body-text">
                                            All correspondence is to be submitted to:
                                        </div>
                                    </td>
                                    <td style="border-left-width: 1pt; border-right-width: 1pt; vertical-align: top; border-left-color: #000000; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-right-color: #000000; padding-right: 1px">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-left-width: 1pt; border-right: #000000 1pt; vertical-align: top; border-left-color: #000000; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 56px">
                                    <td class="auto-style15">
                                        <div>
                                        </div>
                                    </td>
                                    <td colspan="4" style="border-right-width: 1pt; vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; border-right-color: #000000; padding-right: 1px">
                                        <div>
                                            <asp:TextBox runat="server" TabIndex="63" ID="txtCorrespond" Style="overflow: hidden; resize: none;" BorderStyle="Solid"
                                                BorderWidth="1px" Height="43px" Width="469px" TextMode="MultiLine" CssClass="disable no-autosize">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="border-left-width: 1pt; border-right: #000000 1pt; vertical-align: top; border-left-color: #000000; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <asp:Panel ID="RepPanel" runat="server" Visible="false" Width="752px">
                            <%--<xsl:choose>
                      <xsl:when test="FormData/mainSection/I_DelegationofAuthority/CityCountyReps">--%>
                            <div style="width: 701px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                <div>
                                    <table class="" style="width: 698px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;" border="0">
                                        <colgroup>
                                            <col style="width: 77px" />
                                            <col style="width: 621px" />
                                        </colgroup>
                                        <tbody valign="top">
                                            <tr style="min-height: 20px">
                                                <td>
                                                    <div align="right">
                                                        <font style="font-family: Verdana; font-weight: 400; font-size: 10pt;">3. </font>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <font style="font-family: Verdana; font-weight: 400; font-size: 10pt;">City/County/Consultant Representatives</font>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr style="min-height: 66px">
                                                <td colspan="2">
                                                    <div>
                                                        <asp:GridView ID="grdRep" runat="server" AutoGenerateColumns="false" CssClass="compact-grid" HeaderStyle-BackColor="#cbd8eb" Height="48px" Style="font-weight: normal; font-size: 10pt" TabIndex="64">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Company or Organization/ Title">
                                                                    <ItemTemplate>
                                                                        <div>
                                                                            <asp:TextBox ID="txtCityOrg" runat="server" AutoPostBack="false" CssClass="disable grow-textarea grow-singleline" TabIndex="0"
                                                                                TextMode="MultiLine" BorderStyle="None" Width="203px" Style="overflow: hidden; resize: none;">
                                                                            </asp:TextBox>
                                                                            <asp:TextBox ID="txtCityTitle" runat="server" AutoPostBack="false" CssClass="disable grow-textarea grow-singleline" TabIndex="0"
                                                                                TextMode="MultiLine" BorderStyle="None" Width="203px" Style="overflow: hidden; resize: none;">
                                                                            </asp:TextBox>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="203px" Height="18px" />

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Name">
                                                                    <ItemTemplate>
                                                                        <div>
                                                                            <asp:TextBox ID="txtCityContactName" runat="server" AutoPostBack="false" CssClass="disable grow-textarea grow-singleline" TabIndex="0"
                                                                                TextMode="MultiLine" BorderStyle="None" Width="150px" Style="overflow: hidden; resize: none;">
                                                                            </asp:TextBox>

                                                                        </div>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="150px" Height="18px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Business Telephone">
                                                                    <ItemTemplate>
                                                                        <div>
                                                                            <asp:TextBox ID="txtCityPhone" runat="server" AutoPostBack="false" CssClass="disable grow-textarea grow-singleline" Style="overflow: hidden; resize: none;"
                                                                                onchange="javascript:formatPhone(this);" TabIndex="0" TextMode="MultiLine" BorderStyle="None" Width="115px">
                                                                            </asp:TextBox>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="98px" Height="18px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Cell Telephone">
                                                                    <ItemTemplate>
                                                                        <div>
                                                                            <asp:TextBox ID="txtCityCellPhone" runat="server" AutoPostBack="false" CssClass="disable grow-textarea grow-singleline"
                                                                                onchange="javascript:formatPhone(this);" TabIndex="0" TextMode="MultiLine" BorderStyle="None" Width="115px"
                                                                                Style="overflow: hidden; resize: none;">
                                                                            </asp:TextBox>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="99px" Height="18px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Email Address">
                                                                    <ItemTemplate>
                                                                        <div>
                                                                            <asp:TextBox ID="txtCityEmail" runat="server" AutoPostBack="false" CssClass="disable grow-textarea grow-singleline" Style="overflow: hidden; resize: none;"
                                                                                onchange="javascript: validateEmail(this);" TabIndex="0" TextMode="MultiLine" BorderStyle="None"
                                                                                Width="166px">
                                                                            </asp:TextBox>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="166px" Height="18px" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <div class="auto-style115">
                                                            <asp:Button ID="AddRep" Text="Insert another representative" runat="server" Width="186px" CssClass="ie-upload-button" OnClientClick="CheckScrollPosition(this) " />
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <%-- </xsl:when>
                    </xsl:choose>--%>
                        </asp:Panel>
                    </div>
                    <div>
                        <asp:Button ID="RepVis" runat="server" Text="Click here to insert the City/County Representatives section" Width="369px" OnClientClick="CheckScrollPosition(this) " CssClass="ie-upload-button" />
                    </div>
                    <div class="auto-style139">
                    </div>
                    <div />
                    <div />
                    <br />
                    <div>
                        <font class="auto-style63" style="font-family: Verdana; font-weight: 400; font-size: 12pt;">II.
            <strong>Progress Schedule and Payment</strong></font>
                    </div>
                    <div>
                        <table style="font-family: Verdana; width: 659px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;" border="0">
                            <colgroup>
                                <col style="width: 27px" />
                                <col style="width: 127px" />
                                <col style="width: 505px" />
                            </colgroup>
                            <tbody valign="top">
                                <tr>
                                    <td style="padding-bottom: 1px; padding-top: 0px; padding-left: 0px; padding-right: 0px">
                                        <div align="left">
                                            <font size="2">A.</font>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div align="left" class="kdot-body-text">
                                            The Contractor shall submit a proposed schedule prior to beginning work
                                                                    on the project.
                                        </div>
                                        <div align="right">
                                            <asp:TextBox runat="server" TabIndex="65" ID="txtIIA" Rows="1" CssClass="disable grow-textarea grow-singleline" Width="624px" Style="overflow: hidden; resize: none;"
                                                BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" TextMode="MultiLine">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 15px">
                                    <td style="vertical-align: middle; padding-bottom: 1px; padding-top: 1px; padding-left: 0px; padding-right: 0px">
                                        <div align="left" style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">
                                            B.                                     
                                        </div>
                                    </td>
                                    <td style="vertical-align: middle; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div class="kdot-body-text">
                                            Early Start:
                                        </div>
                                    </td>
                                    <td style="vertical-align: bottom; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div>
                                            <font size="2">
                                                <asp:TextBox ID="txtEarlyStart" runat="server" onchange="javascript:CheckScrollPosition(this);" AutoPostBack="true"
                                                    TabIndex="66" TextMode="SingleLine" CssClass="disable" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                                </asp:TextBox>
                                                <asp:TextBox ID="dteEarlyStart" onchange="javascript:CheckScrollPosition(this);" runat="server" AutoPostBack="true" CssClass="disable" BorderStyle="None" Width="0px" TabIndex="-1" onfocus="this.blur();"></asp:TextBox>
                                            </font>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 26px">
                                    <td rowspan="2" style="vertical-align: middle; padding-bottom: 1px; padding-top: 0px; padding-left: 0px; padding-right: 0px">
                                        <div align="left">
                                            <font size="2">C.</font>
                                        </div>
                                    </td>
                                    <td style="vertical-align: middle; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div class="kdot-body-text">
                                            Late Start:
                                        </div>
                                    </td>
                                    <td style="vertical-align: bottom; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div>
                                            <font size="2">
                                                <asp:TextBox ID="txtLateStart" onchange="javascript:CheckScrollPosition(this);" runat="server"
                                                    AutoPostBack="true" TabIndex="67" TextMode="SingleLine" CssClass="disable" BorderColor="#CCCCCC" BorderStyle="Solid"
                                                    BorderWidth="1px">
                                                </asp:TextBox>
                                                <asp:TextBox ID="dteLateStart" TabIndex="-1" onfocus="this.blur();" onchange="javascript:CheckScrollPosition(this);" runat="server" AutoPostBack="true"
                                                    CssClass="disable" BorderStyle="None" Visible="true" Width="0px">
                                                </asp:TextBox>
                                            </font>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 4px">
                                    <td rowspan="2" style="vertical-align: middle; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div class="kdot-body-text">
                                            Tentative Start:
                                        </div>
                                    </td>
                                    <td rowspan="2" style="vertical-align: bottom; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div>
                                            <font size="2">
                                                <asp:TextBox ID="txtTentStart" onchange="javascript:CheckScrollPosition(this);" runat="server" AutoPostBack="true"
                                                    TabIndex="68" TextMode="SingleLine" CssClass="disable" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                                </asp:TextBox>
                                                <asp:TextBox ID="dteTentStart" onchange="javascript:CheckScrollPosition(this);" runat="server" AutoPostBack="true" onfocus="this.blur();"
                                                    CssClass="disable" TabIndex="-1" BorderStyle="None" Width="0px" Visible="true">
                                                </asp:TextBox>
                                            </font>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 20px">
                                    <td style="vertical-align: middle; padding-bottom: 1px; padding-top: 0px; padding-left: 0px; padding-right: 0px">
                                        <div align="left">
                                            <font size="2">D.</font>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 20px">
                                    <td style="padding-bottom: 0px; padding-top: 2px; padding-left: 0px; padding-right: 0px">
                                        <div align="left">
                                            <font size="2">E.</font>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="kdot-body-text">The only contract work allowed before the Notice to Proceed is contract surveying. No other contract work shall be allowed, including driving traffic signs stubs, until the Notice to Proceed is issued.</div>
                                        <div>
                                            <font size="2">
                                                <asp:TextBox runat="server" TabIndex="69" ID="txtIIE" Rows="1" Width="621px" TextMode="MultiLine" CssClass="disable grow-textarea grow-singleline"
                                                    style="overflow: auto; resize: none; border: solid; border-width: 0.5px;" BorderColor="#CCCCCC" BorderStyle="Solid"
                                                    BorderWidth="1px">
                                                </asp:TextBox>
                                            </font>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 20px">
                                    <td style="padding-bottom: 0px; padding-top: 2px; padding-left: 0px; padding-right: 0px">
                                        <div align="left" style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">
                                            F.
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="kdot-body-text">
                                            Working day charges are determined by the C.I.O.W. The Contractor has
                                                                    10 calendar days to dispute differences.
                                        </div>
                                        <div>
                                            <asp:TextBox ID="txtIIF" runat="server" TabIndex="70" Width="621px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Rows="1">
                                            </asp:TextBox>

                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 20px">
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 0px; padding-right: 0px">
                                        <div align="left" style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">
                                            G.                                       
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="kdot-body-text">
                                            Contractor shall notify project supervisor at least 24 hours in advance
                                                                    for required inspection on Saturdays.
                                        </div>
                                        <div>
                                            <asp:TextBox runat="server" TabIndex="71" ID="txtIIG" Width="621px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Rows="1">
                                            </asp:TextBox>

                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 20px">
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 0px; padding-right: 0px">
                                        <font color="#0000ff"></font>
                                        <div align="left" style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">
                                            H.
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="kdot-body-text">
                                            Completion date requirements, liquidated damages, incentive/disincentives,
                                                                    and cleanup days are as follows.
                                            <asp:TextBox runat="server" TabIndex="72" ID="txtIIH" Width="621px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Rows="1">
                                            </asp:TextBox>
                                        </div>

                                    </td>
                                </tr>
                                <tr style="min-height: 4px">
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 0px; padding-right: 0px" class="auto-style45">
                                        <div style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">
                                            I.
                                        </div>
                                    </td>
                                    <td colspan="2" class="auto-style45">
                                        <div class="kdot-body-text">
                                            Contractor shall submit an updated schedule to the Engineer within 5
                                                                    business days after the following events occur(108.3 e) 
                                        </div>
                                        <div>
                                            <table class="auto-style83" style="border-collapse: collapse; border-spacing: 0px;" border="0">
                                                <colgroup>
                                                    <col style="width: 33px"></col>
                                                    <col style="width: 591px"></col>
                                                </colgroup>
                                                <tbody valign="top">
                                                    <tr>
                                                        <td class="auto-style114">
                                                            <div style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">
                                                                1.
                                                            </div>
                                                        </td>
                                                        <td class="auto-style114">
                                                            <div class="kdot-body-text">
                                                                a contract change that effects the schedule by 10 working days
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">
                                                                2.
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="kdot-body-text">
                                                                a contract delay that effects the schedule by 10 working days
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">
                                                                3.
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="kdot-body-text">
                                                                work falls behind the latest schedule by 10 working days (14 days for
                                                                                        CCD)
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 20px">
                                    <td style="padding-bottom: 0px; padding-top: 4px; padding-left: 0px; padding-right: 0px" class="auto-style43" valign="top">
                                        <div style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">J.</div>
                                    </td>
                                    <td colspan="2" class="auto-style43">
                                        <div class="kdot-body-text">
                                            Is the Contractor requesting Electronic Deposit?
                              <asp:RadioButtonList ID="optElecDep" runat="server" onchange="javascript:SetRadioButton(this,'Select whether the Contractor is requesting electronic deposit or not.');" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="73">
                                  <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                  <asp:ListItem Value="2" Text="No"></asp:ListItem>
                              </asp:RadioButtonList>


                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 20px">
                                    <td style="padding-bottom: 0px; padding-top: 4px; padding-left: 0px; padding-right: 0px" valign="top">
                                        <div style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">K.</div>
                                    </td>
                                    <td colspan="2">
                                        <div class="kdot-body-text">
                                            Does the Contractor want to be paid once or twice monthly?
                         <asp:RadioButtonList ID="optPmtFreq" runat="server"
                             onchange="javascript:SetRadioButton(this,'Select how often the contract wants to be paid.');"
                             AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="74">
                             <asp:ListItem Value="1" Text="Once"></asp:ListItem>
                             <asp:ListItem Value="2" Text="Twice"></asp:ListItem>
                         </asp:RadioButtonList>

                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 20px">
                                    <td colspan="3" style="padding-bottom: 0px; padding-top: 2px; padding-left: 0px; padding-right: 0px">
                                        <div align="left">
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div align="left">
                        <asp:TextBox runat="server" TabIndex="75" ID="txtIIAdditional" BorderColor="Black" TextMode="MultiLine" BorderStyle="Solid"
                            BorderWidth="1px" CssClass="auto-style24 animated" Height="50px" Width="651px" Style="margin-left: 2px; resize: none;">
                        </asp:TextBox>
                    </div>
                    <br />
                    <div><font class="auto-style63" style="font-family: Verdana; font-weight: 400; font-size: 12pt;">III. <strong>Right-of-Way/Utilities</strong></font></div>
                    <br />
                    <div class="auto-style141">
                    </div>
                    <div>
                        <div title="" class="auto-style10" style="padding-bottom: 0px; padding-top: 0px; padding-left: 1px; margin-left: 0.4in; padding-right: 0px; font-size: 10pt; font-weight: normal;" align="left">
                            <div>
                                <table class="auto-style11" border="0" style="font-family: Verdana; font-size: 10pt; border-spacing: 0px; border-collapse: collapse">
                                    <colgroup>
                                        <col />
                                        <col style="width: 97px" />
                                        <col style="width: 112px" />
                                        <col style="width: 415px" />
                                    </colgroup>
                                    <tbody valign="top">
                                        <tr style="min-height: 29px">
                                            <td style="vertical-align: top; padding-bottom: 2px; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style23">
                                                <div align="left" style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">
                                                    A.
                                                </div>
                                            </td>
                                            <td style="vertical-align: top; padding-bottom: 1px; padding-top: 0px; padding-left: 1px; padding-right: 1px" class="auto-style77">
                                                <div class="auto-style81 kdot-body-text">
                                                    Right of Way:
                                                </div>
                                            </td>
                                            <td style="vertical-align: top; padding-bottom: 1px; padding-top: 0px; padding-left: 1px; padding-right: 1px">
                                                <div style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">
                                                    <asp:RadioButtonList ID="optNAROW" runat="server" RepeatLayout="Flow" onchange="javascript:optBtnCondFormat(this,'grpROWAcquired',2);SetRadioButton(eval('optROWAcquired'),'Select whether or not the Right of Way has been acquired.');" AutoPostBack="false" RepeatDirection="Horizontal" Height="20px" TabIndex="76">
                                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <%--<strong><font size="3"></font></strong><strong><font size="3"></font></strong>--%>
                                                </div>
                                            </td>
                                            <td style="vertical-align: top; padding-bottom: 1px; padding-top: 0px; padding-left: 1px; padding-right: 1px">
                                                <asp:Panel ID="grpROWAcquired" runat="server" Style="display: inline">
                                                    <div style="width: 100%; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                        <div class="auto-style12 kdot-body-text">
                                                            Has all Right-of-Way been acquired?
                              <asp:RadioButtonList ID="optROWAcquired" RepeatLayout="Flow" runat="server" onchange="javascript:SetRadioButton(this,'Select whether or not the Right of Way has been acquired.');" AutoPostBack="false" Height="20px" RepeatDirection="Horizontal" Width="104px" TabIndex="77">
                                  <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                  <asp:ListItem Text="No" Value="2"></asp:ListItem>
                              </asp:RadioButtonList>
                                                        </div>
                                                        <div class="input-container">
                                                            <asp:TextBox ID="txtIIIA1" runat="server" onchange="javascript:CheckScrollPosition(this);" AutoPostBack="true" TabIndex="78" TextMode="SingleLine" CssClass="disable textbox-with-clear" Width="413px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; padding-bottom: 1px; padding-top: 4px; padding-left: 1px; padding-right: 1px" class="auto-style23">
                                                <div align="left" style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">
                                                    B.
                                                </div>
                                            </td>
                                            <td colspan="3" style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                                <div class="auto-style41 kdot-body-text">
                                                    Utilities:
                                                                <asp:RadioButtonList ID="optUtility" runat="server" onchange="javascript: optBtnCondFormat(this,'grpUtilities',2);" AutoPostBack="false" RepeatLayout="Flow" RepeatDirection="Horizontal" Height="20px" TabIndex="79">
                                                                    <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                    <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                </div>
                                                <asp:Panel Visible="true" ID="grpUtilities" runat="server" Style="font-weight: normal; font-size: 10pt">
                                                    <div style="width: 100%; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                        <div>
                                                            <asp:GridView ID="grdUtility" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#cbd8eb" CssClass="compact-grid kdot-grid-header" TabIndex="80">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Utility">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox runat="server" Text='<%# Bind("txtUtilityName") %>' AutoPostBack="false" TabIndex="0" TextMode="SingleLine" CssClass="disable" ID="txtUtilityName" Width="158px" BorderStyle="None" Height="18px"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="158px" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Status">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox runat="server" Text='<%# Bind("txtUtilityStatus") %>' AutoPostBack="false" TabIndex="0" TextMode="SingleLine" CssClass="disable" ID="txtUtilityStatus" Width="91px" BorderStyle="None" Height="18px"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="91px" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Expected Completion">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox runat="server" Text='<%# Bind("txtUtilityExpCompl") %>' AutoPostBack="false" TabIndex="0" TextMode="SingleLine" CssClass="disable" ID="txtUtilityExpCompl" Width="111px" BorderStyle="None" Height="18px"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="111px" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Comments">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox Text='<%# Bind("txtUtilityComments") %>' runat="server" AutoPostBack="false" TabIndex="-1" TextMode="MultiLine" CssClass="disable allow-grow no-clear"
                                                                                ID="txtUtilityComments" BorderStyle="None" Width="254px" Height="18px" Style="resize: none;">
                                                                            </asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="254px" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <div style="width: 618px">
                                                                <strong>
                                                                    <asp:Button ID="AddUtility" runat="server" Height="22px" OnClick="AddUtility_Click" Text="Add Utility" Width="74px" OnClientClick="CheckScrollPosition(this) " CssClass="ie-upload-button" />
                                                                </strong>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div>
                        <asp:TextBox ID="txtIIIAdditional" runat="server" AutoPostBack="false" TabIndex="81" BorderStyle="Solid" CssClass="auto-style19 animated"
                            Height="43px" Width="656px" TextMode="MultiLine" BorderWidth="1px" Style="margin-left: 41px; resize: none;">
                        </asp:TextBox>
                    </div>
                    <div class="auto-style142">
                        <strong><font size="3"></font></strong>
                    </div>
                    <br />
                    <div><font class="auto-style63" style="font-family: Verdana; font-weight: 400; font-size: 12pt;">IV. <strong>Labor Compliance</strong></font></div>
                    <div>
                        <table class="" style="width: 699px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px; font-family: Verdana; font-weight: 400; font-size: 10pt;" border="0">
                            <colgroup>
                                <col style="width: 41px" />
                                <col style="width: 26px" />
                                <col style="width: 26px" />
                                <col style="width: 26px" />
                                <col style="width: 580px" />
                            </colgroup>
                            <tbody valign="top">
                                <tr style="min-height: 130px">
                                    <td style="border-bottom-color: " class="auto-style109">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; border-bottom-color: ; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div align="left">
                                            1.
                                        </div>
                                    </td>
                                    <td colspan="3" style="border-left-color; border-bottom-color;">
                                        <div class="kdot-body-text">
                                            All Contractors/Subcontractors/trucking firms will be required to submit electronic payrolls using AASHTOWARE Projects Civil Rights Labor (CRL). Additional information that is required to be entered is Subcontractor payments and bidder quoter information. More information can be found at <a href="http://www.ksdot.gov/bureaus/burConsMain/crl.asp" target="_blank">http://www.ksdot.gov/bureaus/burConsMain/crl.asp</a>.
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3" style="height: 45px;"></td>
                                </tr>

                                <tr>
                                    <td class="auto-style109">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div align="left">
                                        </div>
                                    </td>
                                    <td colspan="3" style="border-left-color: ; border-bottom-color: ">
                                        <div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style109">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div align="left" style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">
                                            A.
                                        </div>
                                    </td>
                                    <td colspan="3" style="padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div class="kdot-body-text">
                                            SubContractors
                                        </div>
                                        <div>
                                            <table class="" style="width: 622px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;" border="0">
                                                <colgroup>
                                                    <col style="width: 22px" />
                                                    <col style="width: 600px" />
                                                </colgroup>
                                                <tbody valign="top">
                                                    <tr>
                                                        <td>
                                                            <div style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.35; letter-spacing: 0.02em;">
                                                                1.
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="auto-style101 kdot-body-text">
                                                                Form 259, 260 and a current tax clearance certificate need to be submitted for Subcontractor
                                                                            approval.
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                2.
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="auto-style114 kdot-body-text">
                                                                Subcontractors must be approved prior to them working on the project.
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                3.
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div>
                                                                <asp:GridView ID="grdSubcontractor" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#cbd8eb" CssClass="compact-grid kdot-grid-header" TabIndex="82">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Name">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox runat="server" AutoPostBack="false" TabIndex="0" TextMode="SingleLine" CssClass="disable" ID="txtSubcontractorName" BorderStyle="None" Width="235px"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="235px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Telephone">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox runat="server" AutoPostBack="false" TabIndex="0" TextMode="SingleLine" onchange="javascript:formatPhone(this);" CssClass="disable" ID="txtSubcontractorPhone" MaxLength="14" BorderStyle="None" Width="168px"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="168px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Work">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtSubcontractorWork" runat="server" AutoPostBack="false" TabIndex="0" TextMode="Multiline"
                                                                                    CssClass="animated disable" Wrap="true" BorderStyle="None" Width="169px" Height="18px" Style="resize: none;"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="169px" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                                <div class="optionalPlaceholder" style="width: 593px">
                                                                    <asp:Button Text="Add Subcontractor" ID="AddSubcontractor" runat="server" Width="125px" OnClientClick="CheckScrollPosition(this) " CssClass="ie-upload-button" />
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style109">&nbsp;</td>
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">&nbsp;</td>
                                    <td colspan="3" style="border-left-color: ">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style109">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div align="left" class="kdot-body-text">
                                            B.
                                        </div>
                                    </td>
                                    <td colspan="3" style="border-left-color: ">
                                        <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            Wage Rate
                                        </div>
                                        <div class="auto-style101 kdot-body-text" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                            1.The Contractor and all Subcontractors are required to meet minimum predetermined wage rates as shown in the General Wage Decision included in the contract.
                                        </div>
                                        <div class="auto-style121" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                            <span class="kdot-body-text">2. If the appropriate classification for a worker is not listed, an additional classification must be requested. Additional wage rate information and a link with instructions for requesting an additional classification can be found at <a href="https://www.ksdot.gov/home/showpublisheddocument/990/638744282734531204" target="_blank">https://www.ksdot.gov/home/showpublisheddocument/990/638744282734531204</a></span>
                                        </div>
                                        <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                            <span class="kdot-body-text">3. This form must be submitted to KDOT's Letting Engineer for approval</span>.
                                        </div>
                                        <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                            <span class="kdot-body-text">4. Wage Rate Interviews will be conducted on at least a quarterly basis or a minimum of 1 for the project.</span>
                                        </div>
                                        <div>
                                            <asp:TextBox ID="txtIIB1" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CssClass="grow-textarea grow-singleline"
                                                Height="18px" Style="overflow: hidden; resize: none;" TabIndex="83" TextMode="MultiLine" Width="624px" Rows="1">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style109">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div align="left" class="kdot-body-text">
                                            C.
                                        </div>
                                    </td>
                                    <td colspan="3" style="border-left-color: ">
                                        <div class="kdot-body-text">
                                            EEO Affirmative Action requirements. The Contractor is required to have an EEO Policy
                                                        and Affirmative Action Plan on file with the Office of Civil Rights Compliance.
                      <asp:TextBox runat="server" TabIndex="84" ID="txtIIB2" Width="624px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                          Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Rows="1">
                      </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 23px">
                                    <td class="auto-style109">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div align="left" class="kdot-body-text">
                                            D.
                                        </div>
                                    </td>
                                    <td colspan="3" style="border-left-color: ">
                                        <div class="kdot-body-text">
                                            Has the Contractor designated an EEO Officer?
                                        </div>
                                        <div>
                                            <asp:RadioButtonList ID="optDesignatedEEO" runat="server" onchange="javascript:SetRadioButton(this,'Identify whether the Contractor has designated an EEO Officer or not.');CheckEEOOfficer('EEO Officer name is required.');" AutoPostBack="false" RepeatDirection="Horizontal" TabIndex="85" CssClass="kdot-body-text">
                                                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="Later" Text="No, but they will at a later date."></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                        <div class="auto-style41 kdot-body-text">
                                            EEO Officer Name:
                                                        <asp:TextBox runat="server" onchange="javascript:CheckTextBox(this,'EEO Officer name is required.');" AutoPostBack="false" TabIndex="86" TextMode="SingleLine"
                                                            CssClass="disable" ID="txtEEOOfficer" MaxLength="35" Width="258px" Style="border-bottom: solid 1px #000000;" BorderStyle="None">
                                                        </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style109">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div align="left" class="kdot-body-text">
                                            E.
                                        </div>
                                    </td>
                                    <td colspan="3" style="border-left-color: ">
                                        <div class="kdot-body-text">
                                            The Contractor is required to submit weekly payrolls to this office using AASHTOWare
                                                        Project Civil Rights Labor (CRL). The payroll should be submitted so that it will
                                                        be in the CRL system no later than seven calendar days after the close of the Contractor's
                                                        pay period. The payrolls should be numbered consecutively, and the last payroll
                                                        submitted should be marked final. The work classifications or classification code
                                                        number must be shown. The classifications shown on the payroll must coincide with
                                                        the classification on the Wage Rate Decision in the contract.
                      <asp:TextBox runat="server" TabIndex="87" ID="txtIIB4" Width="626px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                          Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Rows="1">
                      </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style109">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div class="kdot-body-text">
                                            F.
                                        </div>
                                    </td>
                                    <td colspan="3" style="border-left-color: ">
                                        <div class="kdot-body-text">
                                            The prime Contractor is also responsible for Subcontractors. The Subcontractors
                                                        shall submit their payrolls to the prime Contractor using AASHTOWare Project Civil
                                                        Rights Labor (CRL) for approval.
                                        </div>
                                        <div>
                                            <asp:TextBox runat="server" TabIndex="88" ID="txtIIB5" Width="625px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Rows="1">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 35px">
                                    <td style="border-bottom-color: " class="auto-style111">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; border-bottom-color: ; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style101">
                                        <div class="kdot-body-text">
                                            G.
                                        </div>
                                    </td>
                                    <td colspan="3" style="border-left-color: ; border-bottom-color: " class="auto-style101">
                                        <div class="auto-style101 kdot-body-text">
                                            For required posters and bulletin boards, see Section 1.10.02 "Enforcement of Labor
                                                        Provisions" of the KDOT Construction Manual or <a href="http://www.ksdot.gov/divadmin/civilrights/" target="_blank">www.ksdot.gov/divadmin/civilrights/</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 35px">
                                    <td style="border-top-color: ; border-bottom-color: " class="auto-style109">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-top-color: ; padding-bottom: 1px; border-bottom-color: ; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div align="left">
                                        </div>
                                    </td>
                                    <td style="border-top-color: ; border-bottom-color: ">
                                        <div class="kdot-body-text">
                                            1.
                                        </div>
                                    </td>
                                    <td colspan="2" style="border-top-color: ; border-left-color: ; border-bottom-color: ">
                                        <div class="kdot-body-text">
                                            Where will the project bulletin board be located?
                                        </div>
                                        <div>
                                            <asp:TextBox ID="txtIIB61A" runat="server" TabIndex="89" Rows="1" onchange="javascript:CheckTextBox(this, 'Enter the location for the project bulletin board. (IV.(Labor Compliance) G. 1.)');"
                                                CssClass="disable grow-textarea grow-singleline" Width="599px" TextMode="MultiLine" Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC"
                                                BorderStyle="Solid" BorderWidth="1px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 22px">
                                    <td class="auto-style110">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; border-bottom-color: ; padding-top: 1px; padding-left: 1px; padding-right: 1px" class="auto-style30">
                                        <div align="left">
                                        </div>
                                    </td>
                                    <td class="auto-style30">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-top-color: ; border-bottom-color: " class="auto-style30">
                                        <div class="kdot-body-text">
                                            A.
                                        </div>
                                    </td>
                                    <td style="border-top-color: ; border-left-color: ; border-bottom-color: " class="auto-style30">
                                        <div class="kdot-body-text">
                                            This will need to be onsite prior to work starting for the project.
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 24px">
                                    <td class="auto-style109">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div align="left">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text">
                                            2.
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="auto-style100 kdot-body-text">
                                            Do you have the up-to-date posters required for this project bulletin board?
                                                        <asp:RadioButtonList ID="optPosters" runat="server" onchange="javascript:optBtnCondFormat(this,'group27',1);" AutoPostBack="false" RepeatDirection="Horizontal" Height="20px" RepeatLayout="Flow" TabIndex="90">
                                                            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                            <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style109">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div align="left">
                                        </div>
                                    </td>
                                    <td colspan="3">
                                        <asp:Panel ID="group27" runat="server" Style="display: inline">
                                            <div style="margin-bottom: 6px; height: 35px; width: 637px; padding-left: 0px; padding-right: 0px" align="left">
                                                <div>
                                                    <table style="border-top-style: none; width: 627px; table-layout: fixed; border-bottom-style: none; border-right-style: none; border-left-style: none" border="0">
                                                        <colgroup>
                                                            <col style="width: 23px" />
                                                            <col style="width: 25px" />
                                                            <col style="width: 579px" />
                                                        </colgroup>
                                                        <tbody valign="top">
                                                            <tr>
                                                                <td style="border-top-style: none; border-bottom-style: none; border-right-style: none; border-left-style: none; border-right-color: ">
                                                                    <div>
                                                                    </div>
                                                                </td>
                                                                <td class="kdot-body-text" style="border-top-style: none; border-bottom-style: none; border-right-style: none; border-left-style: none; border-right-color: ">A.
                                                                </td>
                                                                <td style="border-top-style: none; border-bottom-style: none; border-right-style: none; border-left-style: none; border-right-color: ">
                                                                    <div class="kdot-body-text">
                                                                        KDOT will supply with the up-to-date posters.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <%--<caption>--%>
                                <tr>
                                    <td class="auto-style109">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                        <div align="left" style="padding-top: 10px">
                                            H.
                                        </div>
                                    </td>
                                    <td colspan="3" rowspan="5" class="ie-font-block">
                                        <div class="kdot-body-text" style="padding-top: 10px">
                                            Discuss each point of the Davis Bacon act:
                                        </div>
                                        <div>
                                            <table border="0" class="" style="width: 633px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;">
                                                <colgroup>
                                                    <col style="width: 25px" />
                                                    <col style="width: 608px" />
                                                </colgroup>
                                                <tbody valign="top">
                                                    <tr>
                                                        <td>
                                                            <div style="padding-top: 10px" class="kdot-body-text">
                                                                1.
                                                            </div>
                                                        </td>
                                                        <td style="padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                                            <div style="padding-top: 10px" class="kdot-body-text">
                                                                <strong>The Davis-Bacon Act: </strong>[40 U.S.C. Sect. 276a.] Davis-Bacon requires payment of locally prevailing wages and fringe benefits to all laborers and mechanics on federally-assisted construction projects in excess of $2,000.
                                                            </div>
                                                            <div>
                                                                <table border="0" class="auto-style21" style="border-collapse: collapse; border-spacing: 0px;">
                                                                    <colgroup>
                                                                        <col style="width: 26px" />
                                                                        <col style="width: 580px" />
                                                                    </colgroup>
                                                                    <tbody valign="top">
                                                                        <tr>
                                                                            <td>
                                                                                <div style="padding-top: 10px" class="kdot-body-text">
                                                                                    A.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div style="padding-top: 10px" class="kdot-body-text">
                                                                                    Regulations are set forth in 29 C.F.R. Parts 1, 3, 5 and 7.
                                                                                </div>
                                                                                <div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <%--<caption>--%>
                                                                        <tr>
                                                                            <td>
                                                                                <div style="padding-top: 10px" class="kdot-body-text">
                                                                                    B.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div style="padding-top: 10px" class="kdot-body-text">
                                                                                    Employees on nonfederal aid and state-funded highway project contracts shall be paid at least the prevailing wage.
                                                                                </div>
                                                                                <div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <%--</caption>--%>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <%-- <caption>--%>
                                                    <%--<caption>--%>
                                                    <tr>
                                                        <td>
                                                            <div style="padding-top: 10px" class="kdot-body-text">
                                                                2.
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div style="padding-top: 10px" class="kdot-body-text">
                                                                <strong>Laborer or mechanic:</strong> Defined as worker whose duties are manual or physical in nature (including those workers who use tools or who are performing the work of a trade) as distinguished from mental or managerial. [29 C.F.R. 5.2(m)]
                                                            </div>
                                                            <br />
                                                            <div>
                                                                <table border="0" class="" style="width: 606px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;">
                                                                    <colgroup>
                                                                        <col style="width: 26px" />
                                                                        <col style="width: 580px" />
                                                                    </colgroup>
                                                                    <tbody valign="top">
                                                                        <tr style="min-height: 20px">
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    A.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    May include non-laborer and non-mechanic, such as foreman, if performing construction work more than 20% of time. [29 C.F.R. 5.2(m)]
                                                                                </div>
                                                                                <div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <%--<caption>--%>
                                                                        <tr style="min-height: 19px">
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    B.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    Executives, supervisors, salaried, and office employees are not covered.
                                                                                </div>
                                                                                <div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <%--<caption>--%>
                                                                        <tr style="min-height: 20px">
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    C.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    Helpers and Apprentices: Must be in approved programs.
                                                                                </div>
                                                                                <div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <%--</caption>
                                      </caption>--%>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <%--<caption>--%>
                                                    <tr>
                                                        <td>
                                                            <div style="padding-top: 10px" class="kdot-body-text">
                                                                3.
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div style="padding-top: 10px" class="kdot-body-text">
                                                                <strong>Wages:</strong> Means the basic hourly rate of pay plus the reasonably anticipated rate of costs to the Contractor or Subcontractor in providing bona fide fringe benefits pursuant to an enforceable commitment communicated in writing to the laborers and mechanics affected. [29 C.F.R. 5.2(p)]
                                                            </div>
                                                            <div>
                                                            </div>
                                                            <div>
                                                                <table border="0" class="" style="width: 606px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;">
                                                                    <colgroup>
                                                                        <col style="width: 26px" />
                                                                        <col style="width: 580px" />
                                                                    </colgroup>
                                                                    <tbody valign="top">
                                                                        <tr>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    A.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    Fringe benefits do not include benefits required by Federal, State or local law.
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    B.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    Wages shall be paid at least once a week. [29 C.F.R. 5.5(a)(1)(i)]
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    C.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    Laborers performing work in more than one classification may be paid at the rate specified for each classification. To pay split-classification wages, accurate records must be kept. [29 C.F.R. 5.59a)(1)(i)]
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    D.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    The wage determination and the Davis-Bacon poster shall be posted at all times by the Contractor and its Subcontractors at the site of work in a prominent and accessible place where it can be easily seen by the workers. [29 C.F.R. 5.5(a)(1)(i)]
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    E.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    Overtime shall be paid at a rate not less than one and one-half times the basic pay rate for all hours worked in excess of forty hours in a workweek. [29 C.F.R. 5.5(b)(1)(i)]
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="kdot-body-text">
                                                                4.
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="kdot-body-text">
                                                                <strong>Principal Contractor: </strong>The Prime or General Contractor is responsible for the compliance of its employees, Subcontractors and lower-tier Subcontractors with Davis-Bacon. [29 C.F.R. 5.5(a)(6), 29 C.F.R. 9(b)(4)]
                                                            </div>
                                                            <div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="padding-top: 10px" class="kdot-body-text">
                                                                5.
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div style="padding-top: 10px" class="kdot-body-text">
                                                                <strong>Site of the Work: </strong>Where Davis-Bacon wage rates apply. Usually means the physical place where the work called for in the contract will remain and any other site where a significant portion of the work is constructed, provided that the site is established specifically for the performance of the contract or project [29 C.F.R. 5.2(1)]
                                                            </div>
                                                            <div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="padding-top: 10px" class="kdot-body-text">
                                                                6.
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div style="padding-top: 10px" class="kdot-body-text">
                                                                <strong>Payroll and Basic Records:</strong> Shall be maintained by the Contractor during the course of the work and for three years following completion of the contract.
                                                            </div>
                                                            <div>
                                                            </div>
                                                            <div>
                                                                <table border="0" class="" style="width: 606px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;">
                                                                    <colgroup>
                                                                        <col style="width: 29px" />
                                                                        <col style="width: 577px" />
                                                                    </colgroup>
                                                                    <tbody valign="top">
                                                                        <tr>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    A.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    Records shall contain for each laborer or mechanic: name, address, social security number, job classification, hourly rates of wages paid, fringes or cash equivalents, daily and weekly number of hours worked, deductions made, gross and net wages paid. [29 C.F.R. 5.5(a)(3)]
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    B.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    Contractor shall submit weekly payrolls to KDOT using AASHTOWare Project Civil Rights Labor (CRL). Identify laborer or mechanic by unique number. Do not use social security number. Contractor may use last 4 digits of social security number to identify laborer or mechanic. Do not include employee address. [29 C.F.R. 5.5(a)(3)]
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    C.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    Prime Contractor is responsible for approval of Subcontractor payrolls using AASHTOWare Project Civil Rights Labor (CRL). [29 C.F.R. 5.5(a)(3)(ii)(A)]
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    D.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    Each payroll shall be accompanied by a “Statement of Compliance” signed by Contractor or Subcontractor or his agent who supervises payment under the contract. [29 C.F.R. 5.5(a)(3)(ii)(B)]
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    E.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    Contractor or Subcontractor shall make the records required available for inspection, copying, or transcription by KDOT or Department of Labor.
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    F.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text">
                                                                                    Failure to submit required payrolls or make them available may result in the suspension of any further payment and may be grounds for debarment. [29 C.F.R. 5.5(a)(3)(iii)]
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div style="padding-top: 10px" class="kdot-body-text">
                                                                                    G.
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="kdot-body-text" style="padding-top: 10px">
                                                                                    Contractor or Subcontractor shall make employees available to KDOT or Department of Labor for interview.
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <%--</caption>
                          </caption>--%>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div>
                                        </div>
                                        <div class="kdot-body-text">
                                            *This document is an outline of the fundamental principles of the Davis-Bacon Act and is in no way intended to be a comprehensive analysis of all Contractor and Subcontractor requirements. If any Contractor or Subcontractor has specific questions regarding their legal obligations, they should seek competent legal counsel.
                      <asp:TextBox ID="txtIIB7" runat="server" Rows="1" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CssClass="grow-textarea grow-singleline"
                          Style="overflow: hidden; resize: none;" TabIndex="91" TextMode="MultiLine" Width="622px">
                      </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <table class="" style="width: 696px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px; font-family: Verdana; font-weight: 400; font-size: 10pt;" border="0">
                            <colgroup>
                                <col style="width: 43px" />
                                <col style="width: 26px" />
                                <col style="width: 627px" />
                            </colgroup>
                            <tbody valign="top">
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 4px; padding-left: 1px; padding-right: 1px">
                                        <div class="kdot-body-text">
                                            I.
                                        </div>
                                    </td>
                                    <td class="kdot-body-text">
                                        <div>
                                            DBE
                                                        <asp:RadioButtonList ID="optDBEParticipation" onchange="javascript:optBtnCondFormat(this,'grpIDBE',2);CheckDBE();" runat="server" AutoPostBack="false"
                                                            RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="92">
                                                            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                            <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                        </div>
                                        <asp:Panel ID="grpIDBE" runat="server">
                                            <div style="width: 687px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                <div class="kdot-body-text">
                                                    1. Does this project have a DBE goal?
                                                                <asp:RadioButtonList ID="optDBEGoal" onchange="javascript:optBtnCondFormat(this,'grpDBEGoal',2);" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="93">
                                                                    <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                    <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                </div>
                                                <asp:Panel Visible="true" ID="grpDBEGoal" runat="server">
                                                    <div style="width: 583px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px 0px 0px 40px; padding-right: 0px" align="left">
                                                        <div>
                                                            <table style="word-wrap: break-word; border-top: medium none; border-right: medium none; width: 580px; border-collapse: collapse; table-layout: fixed; border-bottom: medium none; border-left: medium none" border="0">
                                                                <colgroup>
                                                                    <col style="width: 20px" />
                                                                    <col style="width: 560px" />
                                                                </colgroup>
                                                                <tbody valign="top">
                                                                    <tr>
                                                                        <td style="vertical-align: bottom; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                                                            <div><font size="2" face="Verdana">A.</font></div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="kdot-body-text">
                                                                                Contract DBE goal percentage: <span>
                                                                                    <asp:TextBox ID="txtDBEGoal" runat="server" onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90));" onchange="javascript:CheckTextBox(this,'DBE Goal Percentage is required if DBE is selected');CheckTBRange(this,0,100,'DBE Goal Percentage must be between 0 and 100',1);" AutoPostBack="false" Style="border-bottom: solid 1px #000000;" TabIndex="94" TextMode="SingleLine" CssClass="disable " BorderStyle="None"></asp:TextBox>
                                                                                </span>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                                                            <div><font size="2" face="Verdana">B.</font></div>
                                                                        </td>
                                                                        <td style="vertical-align: bottom; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px; white-space: nowrap">
                                                                            <div class="kdot-body-text" style="display: inline; white-space: nowrap;">
                                                                                Contractor DBE commitment percentage at time of letting:  <span>
                                                                                    <asp:TextBox ID="txtDBECommitment" onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90));" onchange="javascript:CheckTextBox(this,'DBE Commitment Percentage is required if DBE is selected');CheckTBRange(this,0,100,'DBE Commitment Percentage must be between 0 and 100',1);" runat="server" Style="border-bottom: solid 1px #000000; display: inline-block;" AutoPostBack="false" TabIndex="95" TextMode="SingleLine" CssClass="disable" BorderStyle="None"></asp:TextBox>
                                                                                </span>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                                    2. Is the list of DBE’s current and unchanged from what was shown in the signed
                                                                contract?
                                                </div>
                                                <div style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                                    <div>
                                                        <asp:RadioButtonList ID="optDBEChanged" CssClass="kdot-body-text" runat="server" onchange="javascript:CheckDBE();" AutoPostBack="false" RepeatDirection="Horizontal" TabIndex="96">
                                                            <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                                                            <asp:ListItem Value="No" Text="No"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                    <div>
                                                        <asp:TextBox runat="server" TabIndex="97" ID="txtIIC2" Rows="1" Width="620px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                            Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                                        </asp:TextBox>
                                                    </div>
                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                                        3. Is there DBE mobilization?
                                                                    <asp:RadioButtonList ID="optLtrDBEMob" onchange="javascript:optBtnCondFormat(this, 'grpI3DBEMob', 2);CheckDBE();" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="98">
                                                                        <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                                                                        <asp:ListItem Value="No" Text="No"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                    </div>
                                                    <asp:Panel ID="grpI3DBEMob" runat="server" Style="display: inline">
                                                        <div style="width: 629px; padding-left: 30px; margin: 1px" align="left">
                                                            <div>
                                                                <table style="border-top-style: none; word-wrap: break-word; width: 594px; border-collapse: collapse; table-layout: fixed; border-bottom-style: none; border-right-style: none; border-left-style: none" border="1">
                                                                    <colgroup>
                                                                        <col style="width: 20px" />
                                                                        <col style="width: 574px" />
                                                                    </colgroup>
                                                                    <tbody valign="top">
                                                                        <tr style="min-height: 0.177in">
                                                                            <td style="border-top-style: none; border-bottom-style: none; border-right-style: none; border-left-style: none">
                                                                                <div class="kdot-body-text">A.</div>
                                                                            </td>
                                                                            <td style="border-top-style: none; border-bottom-style: none; border-right-style: none; border-left-style: none">
                                                                                <div class="kdot-body-text">A written request must be submitted for partial payment of this item</div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="border-top-style: none; border-top-color: ; border-bottom-style: none; border-right-style: none; border-left-style: none">
                                                                                <div>B.</div>
                                                                            </td>
                                                                            <td style="border-top-style: none; border-top-color: ; border-bottom-style: none; border-right-style: none; border-left-style: none">
                                                                                <div class="kdot-body-text">If DBE mobilization is over 10% of their work – payment can only be made up to 10% until their work is complete.</div>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div></div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="kdot-body-text">
                                                4. Is DBE trucking being used toward the goal?
                                                                <asp:RadioButtonList ID="optDBETruck" CssClass="kdot-body-text" onchange="javascript:CheckDBE();optBtnCondFormat(this, 'grpLabotDBETruck', 2);optBtnCondFormat(this,'grpLaborDBETruckNoList',2);SetRadioButton2('optDBETruckList','Select whether or not the Contractor submitted a trucking vehicle list for DBE trucking (Labor Compliance - DBE)');" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="99">
                                                                    <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                    <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                            </div>
                                            <asp:Panel ID="grpLabotDBETruck" runat="server">
                                                <div style="width: 638px; padding-left: 30px; margin: 1px" align="left">
                                                    <div>
                                                        <table style="border-top-style: none; word-wrap: break-word; width: 594px; border-collapse: collapse; table-layout: fixed; border-bottom-style: none; border-right-style: none; border-left-style: none" border="1">
                                                            <colgroup>
                                                                <col style="width: 20px" />
                                                                <col style="width: 574px" />
                                                            </colgroup>
                                                            <tbody valign="top">
                                                                <tr>
                                                                    <td style="border-top-style: none; border-bottom-style: none; border-right-style: none; border-left-style: none">
                                                                        <div class="kdot-body-text">A.</div>
                                                                    </td>
                                                                    <td style="border-top-style: none; border-bottom-style: none; border-right-style: none; border-left-style: none">
                                                                        <div class="kdot-body-text">
                                                                            Has a copy of the trucking vehicle list (trucks) been submitted by the Prime Contractor?
                                      <asp:RadioButtonList ID="optDBETruckList" onchange="javascript:optBtnCondFormat(this, 'grpLaborDBETruckNoList', 1);SetRadioButton(this, 'Select whether or not the Contractor submitted a trucking vehicle list for DBE trucking (Labor Compliance - DBE)');" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="100">
                                          <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                          <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                      </asp:RadioButtonList>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="grpLaborDBETruckNoList" runat="server">
                                                <div style="width: 638px; padding-left: 30px; margin: 1px" align="left">
                                                    <div>
                                                        <table style="border-top-style: none; word-wrap: break-word; width: 591px; border-collapse: collapse; table-layout: fixed; border-bottom-style: none; border-right-style: none; border-left-style: none" border="1">
                                                            <colgroup>
                                                                <col style="width: 18px" />
                                                                <col style="width: 573px" />
                                                            </colgroup>
                                                            <tbody valign="top">
                                                                <tr>
                                                                    <td style="border-top-style: none; border-bottom-style: none; border-right-style: none; border-left-style: none">
                                                                        <div></div>
                                                                    </td>
                                                                    <td style="border-top-style: none; border-bottom-style: none; border-right-style: none; border-left-style: none"><span class="kdot-body-text">If the trucking vehicle list has not been received by the administering field office, no contract work by the DBE truckers will be allowed until the list has been received. DBE trucking process to maintain compliance while performing DBE trucking is in Special Contract Provision 07-18-80 latest version section (7).  If there are additional questions, contact KDOT Office of Civil Rights Compliance at (785) 296-7940.</span></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style41">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="" class="auto-style41">J.
                                    </td>
                                    <td class="auto-style41">
                                        <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            Highway Construction Trainees
                                                        <asp:RadioButtonList ID="optTrainees" CssClass="kdot-body-text" runat="server" onchange="javascript:optBtnCondFormat(this, 'grpHwyConstTrainees', 2) " AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="101">
                                                            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                            <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <span />
                                        <asp:Panel ID="grpHwyConstTrainees" runat="server">
                                            <div style="width: 100%" align="left">
                                                <div>
                                                    <table class="auto-style46" style="border-collapse: collapse; border-spacing: 0px;" border="0">
                                                        <colgroup>
                                                            <col style="width: 26px" />
                                                            <col style="width: 598px" />
                                                        </colgroup>
                                                        <tbody valign="top">
                                                            <tr style="min-height: 42px">
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        1.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                                                        Liquidated damages will occur if the Contractor does not meet the hours.
                                    <asp:TextBox runat="server" TabIndex="102" ID="txtIID1" Rows="1" Width="585px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                        Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                    </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr style="min-height: 41px">
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        2.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                                                        No work may begin until KDOT has approved the trainee schedule. 
                                    <asp:TextBox runat="server" TabIndex="103" ID="txtIID2" Rows="1" Width="585px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                        Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                    </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        3.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                                                        Submit weekly Form 231 with payroll. 
                                    <asp:TextBox runat="server" TabIndex="104" ID="txtIID3" Rows="1" Width="585px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                        Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                    </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 2px; padding-left: 1px; border-right-color: ; padding-right: 1px">
                                        <div class="kdot-body-text">
                                            K.
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Panel ID="group18" runat="server" Style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in" Height="17px">
                                            <div title="" class="xdSection xdRepeating" style="border-top: #ffffff 1pt; border-right: #ffffff 1pt; width: 240px; border-bottom: #ffffff 1pt; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; border-left: #ffffff 1pt; padding-right: 0px"
                                                align="left" xd:xctname="Section" xd:ctrlid="CTRL909" tabindex="-1" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                                                xmlns:xd="http://schemas.microsoft.com/office/infopath/2003">
                                                <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                                    Prompt Pay (SP 07-01017-R3)
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="group19" runat="server" Style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in" Height="18px">
                                            <div title="" class="xdSection xdRepeating" style="border-top: #ffffff 1pt; border-right: #ffffff 1pt; width: 99%; border-bottom: #ffffff 1pt; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; border-left: #ffffff 1pt; padding-right: 0px"
                                                align="left" xd:xctname="Section" xd:ctrlid="CTRL910" tabindex="-1" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                                                xmlns:xd="http://schemas.microsoft.com/office/infopath/2003">
                                                <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in" class="auto-style127">
                                                    Payment to Subcontractors &amp; Suppliers (Section 109.6)
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <!--EndFragment-->
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-top-color: " class="ie-font-block">
                                        <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                            <table class="auto-style125 promptpay-table" style="border-collapse: collapse; border-spacing: 0px;" border="0">
                                                <colgroup>
                                                    <col style="width: 27px"></col>
                                                    <col style="width: 589px"></col>
                                                </colgroup>
                                                <tbody valign="top">
                                                    <tr>
                                                        <td style="vertical-align: top; padding-top: 0;">
                                                            <div class="kdot-body-text">
                                                                1.
                                                            </div>
                                                        </td>
                                                        <td style="vertical-align: top;">
                                                            <div class="kdot-body-text">Bid item price sheets and 1<b>st</b> tier Subcontractors shall be submitted prior to first payment.</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="kdot-body-text">2.</td>
                                                        <td class="kdot-body-text" style="white-space: nowrap !important;">Subcontractors and suppliers shall be paid within 10 calendar days of receiving payment.
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="kdot-body-text">3.</td>
                                                        <td class="kdot-body-text">Within 15 calendar days after receiving payment from the Secretary, the prime Contractor shall certify individual line items for Subcontractor payments for subcontract services using AASHTOWare Project Civil Rights Labor (CRL)</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="kdot-body-text">4.</td>
                                                        <td class="kdot-body-text">Consider this your notice that failure to meet the requirements in section 109.6
                                                                        KDOT will impose the following sanctions outlined in section 109.7 Sanctions for
                                                                        Failure to Pay Promptly.</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <asp:Panel ID="group19_2" runat="server">
                                            <div>
                                                <div>
                                                    <table class="" style="width: 612px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;" border="0">
                                                        <colgroup>
                                                            <col style="width: 27px" />
                                                            <col style="width: 31px" />
                                                            <col style="width: 554px" />
                                                        </colgroup>
                                                        <tbody valign="top">
                                                            <tr style="min-height: 19px">
                                                                <td class="auto-style9">
                                                                    <div>
                                                                    </div>
                                                                </td>
                                                                <td style="border-top-color: ; border-right-color: ">
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                                                        A.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in" class="kdot-body-text">
                                                                        Failure to pay promptly without good cause, pay an interest penalty to the affected
                                                                                    Subcontractor at the rate of 1.5% per month
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr style="min-height: 19px">
                                                                <td style="border-top-color: " class="auto-style9">
                                                                    <div>
                                                                    </div>
                                                                </td>
                                                                <td style="border-top-color: ; border-right-color: ">
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                                                        B.
                                                                    </div>
                                                                </td>
                                                                <td style="border-top-color: ; border-bottom-color: ; border-right-color: ">
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                                                        If a Contractor fails to comply with the certification requirements of subsection 109.6, the Secretary may impose liquidated damages of $50.00 per calendar day per Subcontractor for each day certification is late.
                                                                    </div>
                                                                    <!--EndFragment-->
                                                                </td>
                                                            </tr>
                                                            <tr style="min-height: 19px">
                                                                <td style="border-top-color: " class="auto-style9">
                                                                    <div>
                                                                    </div>
                                                                </td>
                                                                <td style="border-top-color: ; border-right-color: ">
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                                                        C.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                                                        If a Contractor fails to make payments according to subsection 109.6, the Secretary may impose liquidated damages of $50.00 per calendar day per Subcontractor for each day the certification is late.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr style="min-height: 19px">
                                                                <td class="auto-style9">
                                                                    <div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                                                        D.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                                                        If a Contractor submits a certification stating payment has been made but knowing payment has not been made, (false certification),&nbsp; the Secretary may&nbsp; impose liquidated damages of $50.00 per calendar day per Subcontractor for each day the certification remains false.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style9">
                                                                    <div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                                                        E.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in" class="auto-style78">
                                                                        If a Contractor fails to comply with the payment requirements without good cause, submits a false certification, or repeatedly fails to comply with the cerification requirements, the Secretary may adjust a Contractors qualification rating, declare the Contractor is not a responsible Contractor, suspend a Contractor from bidding, or debar a Contractor from bidding.
                            
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="border-top-color: " class="auto-style9">
                                                                    <div>
                                                                    </div>
                                                                </td>
                                                                <td style="border-top-color: ; border-right-color: ">
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                                                        F.
                                                                    </div>
                                                                </td>
                                                                <td style="border-top-color: ; border-bottom-color: ; border-right-color: ">
                                                                    <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in"
                                                                        class="kdot-body-text">
                                                                        For each violation, Contractor may receive one or more sanctions provided.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr style="min-height: 56px">
                                    <td colspan="3">
                                        <div>
                                            <asp:TextBox runat="server" TabIndex="105" ID="txtIVAdditional" BorderStyle="Solid" BorderWidth="1px"
                                                CssClass="auto-style24 animated" Height="48px" Width="643px" TextMode="MultiLine" Style="resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in" class="auto-style143">
                        <strong><font size="3"></font></strong>
                    </div>
                    <br />
                    <div><font class="auto-style63" style="font-family: Verdana; font-weight: 400; font-size: 12pt;">V. <strong>Safety</strong></font></div>
                    <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                        <table class="" style="width: 696px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px; font-size: 10pt; font-weight: normal;" border="0">
                            <colgroup>
                                <col style="width: 41px" />
                                <col style="width: 26px" />
                                <col style="width: 629px" />
                            </colgroup>
                            <tbody valign="top" style="font-family: Verdana; font-size: 10pt;">
                                <tr>
                                    <td style="border-bottom-color: ">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-bottom-color: ">
                                        <div class="kdot-body-text">
                                            A.
                                        </div>
                                    </td>
                                    <td style="border-bottom-color: ">
                                        <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            The Contractor and Subcontractor must comply with all applicable safety regulations,
                                                        including OSHA.
                <asp:TextBox runat="server" TabIndex="106" ID="txtSafetyA" Rows="1" Width="618px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                    Style="overflow: hidden; resize: none" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text">
                                            B.
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            The Contractor is required to submit a copy of their safety policy. 
                    <asp:TextBox runat="server" TabIndex="108" ID="txtSafetyC" Rows="1" Width="618px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                        Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                    </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text">
                                            C.
                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-container kdot-body-text">
                                            Contractor’s Safety Officer.
                <asp:TextBox ID="txtSafetyD" onchange="javascript:CheckTextBox(this,'The Contractor Safety Officer is required.');" runat="server" TabIndex="109" Width="420px" CssClass="textbox-with-clear req" Height="20px" TextMode="SingleLine" Style="border-bottom: solid; border-width: 1px" AutoPostBack="false" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text">
                                            D.
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            What Safety Equipment does the Contractor require for inspectors on the project?
                    <asp:TextBox runat="server" TabIndex="110" ID="txtSafetyE" Rows="1" Width="618px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                        Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                    </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text">
                                            E.
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            KDOT Safety personnel may inspect the project. 
                      <asp:TextBox runat="server" TabIndex="111" ID="txtSafetyF" Rows="1" Width="618px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                          Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                      </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 54px">
                                    <td colspan="3">
                                        <div>
                                            <asp:TextBox ID="txtSafetyAdditional" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="auto-style24 animated"
                                                Height="48px" TabIndex="112" TextMode="MultiLine" Width="643px" Style="resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in" class="auto-style144">
                        <%--<span /><span />--%>
                    </div>
                    <div style="padding-top: 10px">
                        <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in; font-family: Verdana; font-size: 12pt; font-weight: 400" class="auto-style60">VI.<strong> Traffic Control</strong></div>
                    </div>
                    <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                        <table style="width: 699px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px; font-size: 10pt; font-weight: normal;" border="0">
                            <colgroup>
                                <col style="width: 41px" />
                                <col style="width: 26px" />
                                <col style="width: 632px" />
                            </colgroup>
                            <tbody valign="top" style="font-family: Verdana; font-size: 10pt">
                                <tr style="min-height: 20px">
                                    <td>
                                        <div style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            <strong><font size="3"></font></strong>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            <strong><font size="3"></font></strong>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 19px">
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 2px; padding-left: 1px; padding-right: 1px">
                                        <div class="kdot-body-text">
                                            A.
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            All traffic control devices shall conform to the
                      <asp:TextBox ID="chkSpecification" runat="server" AutoPostBack="false" Style="text-align: center;" BorderStyle="None" ReadOnly="true" TabIndex="-1" TextMode="SingleLine" Width="33px"></asp:TextBox>
                                            &nbsp;Standard Specifications, the contract Special Provisions, the Plans, and the current Manual on Uniform Traffic Control Devices (MUTCD). 
                      <asp:TextBox runat="server" TabIndex="113" ID="txtVIA" Rows="1" Width="619px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                          Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                      </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 20px">
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text">
                                            B.
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text">
                                            All traffic control devices on the project are required to be NCHRP 350 or MASH
                                                        report 2009 compliant. The Contractor shall submit certifications of compliance
                                                        prior to use. 
                      <asp:TextBox runat="server" TabIndex="114" ID="txtVIB" Rows="1" Width="619px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                          Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                      </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 20px">
                                    <td style="border-top-color: ">
                                        <div>
                                        </div>
                                    </td>
                                    <td style="border-top-color: ">
                                        <div class="kdot-body-text">
                                            C.
                                        </div>
                                    </td>
                                    <td style="border-top-color: ">
                                        <div class="kdot-body-text">
                                            All flaggers shall have communication skills to effectively communicate with the
                                                        public and shall follow the State of Kansas Traffic Control Handbook for flaggers.
                                                        
                      <asp:TextBox runat="server" TabIndex="115" ID="txtIVD" Rows="1" Width="619px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                          Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                      </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 20px">
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text">
                                            D.
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text">
                                            Traffic Control Contacts
                                        </div>

                                        <!-- ROW 1 -->
                                        <div class="tc-row">
                                            <span class="tc-label kdot-body-text">Contractor's Representative:</span>

                                            <span class="tc-field">
                                                <div class="input-container">
                                                    <asp:TextBox ID="txtCntrsRep" runat="server"
                                                        onchange="javascript:CheckTextBox(this,'Contractors representative for traffic control is required.',true);"
                                                        AutoPostBack="false" TabIndex="116"
                                                        TextMode="SingleLine" Height="18px"
                                                        CssClass="textbox-with-clear"
                                                        MaxLength="35" Width="200px"
                                                        Style="border-bottom: solid; border-width: 1px;"
                                                        BorderStyle="None">
                                                    </asp:TextBox>
                                                </div>
                                            </span>

                                            <span class="tc-phone-label kdot-body-text">Phone:</span>

                                            <span class="tc-phone">
                                                <div class="input-container">
                                                    <asp:TextBox ID="txtCntrsRepPhone" runat="server"
                                                        AutoPostBack="false" TabIndex="117"
                                                        TextMode="SingleLine" Height="18px"
                                                        onchange="javascript:CheckTextBox(this,'Contractors representative for traffic control phone number is required.',true);formatPhone(this);"
                                                        CssClass="textbox-with-clear phone-small"
                                                        MaxLength="14"
                                                        Style="border-bottom: solid; border-width: 1px;"
                                                        BorderStyle="None">
                                                    </asp:TextBox>
                                                </div>
                                            </span>
                                        </div>

                                        <!-- ROW 2 -->
                                        <div class="tc-row">
                                            <span class="tc-label kdot-body-text">Emergency Contact:</span>

                                            <span class="tc-field">
                                                <div class="input-container">
                                                    <asp:TextBox ID="txtEmergContact" runat="server"
                                                        onchange="javascript:CheckTextBox(this,'Emergency contact for traffic control is required.',true);"
                                                        AutoPostBack="false" TabIndex="118"
                                                        TextMode="SingleLine" Height="18px"
                                                        CssClass="textbox-with-clear"
                                                        MaxLength="35" Width="200px"
                                                        Style="border-bottom: solid; border-width: 1px;"
                                                        BorderStyle="None">
                                                    </asp:TextBox>
                                                </div>
                                            </span>

                                            <span class="tc-phone-label kdot-body-text">Phone:</span>

                                            <span class="tc-phone">
                                                <div class="input-container">
                                                    <asp:TextBox ID="txtEmergContactPhone" runat="server"
                                                        AutoPostBack="false" TabIndex="119"
                                                        TextMode="SingleLine" Height="18px"
                                                        onchange="javascript:CheckTextBox(this,'Emergency contact phone number for traffic control is required.',true);formatPhone(this);"
                                                        CssClass="textbox-with-clear phone-small"
                                                        MaxLength="14"
                                                        Style="border-bottom: solid; border-width: 1px;"
                                                        BorderStyle="None">
                                                    </asp:TextBox>
                                                </div>
                                            </span>
                                        </div>

                                        <div class="auto-style88"></div>

                                        <!-- GRID (UNCHANGED) -->
                                        <div class="no-scroll-anchor">
                                            <asp:UpdatePanel ID="upKdotContact" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div id="KdotGridAnchor"></div>
                                                    <div style="width: 432px; margin: 0;" align="left">

                                                        <asp:GridView ID="grdContact" runat="server" CssClass="kdot-grid-header"
                                                            AutoGenerateColumns="false"
                                                            HeaderStyle-BackColor="#cbd8eb"
                                                            Height="48px"
                                                            TabIndex="120">

                                                            <Columns>
                                                                <asp:TemplateField HeaderText="KDOT Contact">
                                                                    <ItemTemplate>
                                                                        <div class="input-container">
                                                                            <asp:TextBox ID="txtKDOTContact" runat="server"
                                                                                CssClass="disable textbox-with-clear"
                                                                                MaxLength="35"
                                                                                TextMode="SingleLine"
                                                                                BorderStyle="None"
                                                                                Height="18px"
                                                                                Width="253px" />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Phone">
                                                                    <ItemTemplate>
                                                                        <div class="input-container">
                                                                            <asp:TextBox ID="txtKDOTContactPhone" runat="server"
                                                                                CssClass="disable textbox-with-clear"
                                                                                MaxLength="14"
                                                                                TextMode="SingleLine"
                                                                                BorderStyle="None"
                                                                                Width="159px"
                                                                                onchange="javascript:formatPhone(this);" />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>

                                                        </asp:GridView>

                                                        <div style="width: 427px">
                                                            <asp:Button ID="AddContract" runat="server"
                                                                Text="Insert another KDOT Contact"
                                                                Width="186px"
                                                                CssClass="ie-upload-button"
                                                                CausesValidation="false"
                                                                OnClick="AddContract_Click" />
                                                        </div>

                                                    </div>

                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                        </div>
                                    </td>


                                </tr>
                                <tr style="min-height: 54px">
                                    <td colspan="3">
                                        <div>
                                            <asp:TextBox runat="server" TabIndex="121" ID="txtTrafficContolAdditional" BorderStyle="Solid" BorderWidth="1px"
                                                CssClass="auto-style24 animated" Height="48px" TextMode="MultiLine" Width="650px" Style="resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in" class="auto-style145">
                    </div>
                    <div style="padding-top: 10px">
                        <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in; font-family: Verdana; font-size: 12pt; font-weight: 400" class="auto-style59">VII.<strong> Project Materials</strong></div>
                    </div>
                    <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                        <table style="width: 699px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px; font-weight: normal; font-size: 10pt;" border="0">
                            <colgroup>
                                <col style="width: 41px" width="41px" />
                                <col style="width: 26px" width="26px" />
                                <col style="width: 618px" width="20px" />
                            </colgroup>
                            <tbody valign="top" style="font-family: Verdana; font-size: 10pt">
                                <tr>
                                    <td>
                                        <div class="auto-style26">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text">
                                            A.
                                        </div>
                                    </td>
                                    <td>
                                        <div class="auto-style33 kdot-body-text">
                                            Use only approved mix designs for concrete and asphalt. Submit the mix designs to
                                                        KDOT using the lead times in the Specifications. 
                                          
                      <asp:TextBox runat="server" TabIndex="122" ID="txtVA" Rows="1" Width="623px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                          Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                      </asp:TextBox>

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="auto-style27"></div>
                                    </td>

                                    <td>
                                        <div>B.</div>
                                    </td>

                                    <td>

                                        <!-- ✅ UpdatePanel INSIDE td (VALID HTML) -->
                                        <!-- 🔒 HARD SCROLL BOUNDARY -->
                                        <div class="no-scroll-anchor">

                                            <asp:UpdatePanel ID="upMaterial" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>

                                                    <div style="margin-bottom: 0; margin-top: 0; padding: 0">

                                                        <asp:GridView ID="grpMaterial" runat="server" CssClass="kdot-grid-header"
                                                            AutoGenerateColumns="false"
                                                            HeaderStyle-BackColor="#cbd8eb"
                                                            Height="48px"
                                                            TabIndex="123">

                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Supplier">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtSupplier" runat="server"
                                                                            CssClass="disable textbox-with-clear"
                                                                            Width="205px"
                                                                            BorderStyle="None"
                                                                            Height="18px" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Material">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtMaterial" runat="server"
                                                                            CssClass="disable textbox-with-clear"
                                                                            Width="196px"
                                                                            BorderStyle="None"
                                                                            Height="18px" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Location">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtMatLocation" runat="server"
                                                                            CssClass="disable textbox-with-clear"
                                                                            Width="208px"
                                                                            BorderStyle="None"
                                                                            Height="18px" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>

                                                        </asp:GridView>

                                                        <div style="width: 627px; margin-top: 4px">
                                                            <asp:Button ID="AddMaterial" runat="server"
                                                                Text="Insert item"
                                                                Width="81px"
                                                                CssClass="ie-upload-button"
                                                                CausesValidation="false"
                                                                OnClick="AddMaterial_Click" />
                                                        </div>

                                                    </div>

                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                        </div>


                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div
                                            style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            <asp:TextBox runat="server" TabIndex="124" ID="txtVB" Rows="1" CssClass="auto-style47 grow-textarea grow-singleline" Width="623px" TextMode="MultiLine"
                                                Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style34">
                                        <div></div>
                                    </td>
                                    <td>
                                        <div>C.</div>
                                    </td>
                                    <td>
                                        <div
                                            class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            Materials Control.
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <table style="width: 699px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px; font-size: 10pt; font-weight: normal;" border="0">
                            <colgroup>
                                <col style="width: 69px" width="69px" />
                                <col style="width: 0px" width="0px" />
                                <col style="width: 26px" width="26px" />
                                <col style="width: 618px" width="618px" />
                            </colgroup>
                            <tbody valign="top" style="font-family: Verdana; font-size: 10pt">
                                <tr
                                    style="min-height: 35px">
                                    <td class="auto-style130">
                                        <div></div>
                                    </td>
                                    <td>
                                        <div></div>
                                    </td>
                                    <td class="auto-style9">
                                        <div
                                            class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            1.
                                        </div>
                                    </td>
                                    <td>
                                        <div
                                            class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in" class="auto-style101">
                                            Before being used on the project, all project materials are to be tested and approved. Furnish all required samples, sample test reports and/or certifications.
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style130">
                                        <div></div>
                                    </td>
                                    <td>
                                        <div></div>
                                    </td>
                                    <td class="auto-style9">
                                        <div
                                            class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            2.
                                        </div>
                                    </td>
                                    <td>
                                        <div
                                            class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in" class="auto-style101">
                                            Obtain all material certifications and provide required information on the certification per Division 2600.
                                        </div>
                                    </td>
                                </tr>
                                <tr
                                    style="min-height: 51px">
                                    <td class="auto-style89">
                                        <div></div>
                                    </td>
                                    <td class="auto-style90">
                                        <div></div>
                                    </td>
                                    <td class="auto-style91">
                                        <div
                                            class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            3.
                                        </div>
                                    </td>
                                    <td class="auto-style90">
                                        <div class="kdot-body-text">
                                            Type A and B certifications may be e-mailed to
                      &nbsp;<a
                          href="mailto:%20KDOT%23CM.Typeabcerts@ks.gov">KDOT#CM.Typeabcerts@ks.gov</a> or sent to the Materials Certification Technician (per section 2601) with a copy to the construction office. A sample cover sheet is in&nbsp;
              <asp:TextBox ID="txtSectiontext2" onchange="javascript:CheckScrollPosition(this);" runat="server" AutoPostBack="true" CssClass="disable"
                  ReadOnly="true" TabIndex="-1" TextMode="SingleLine" BorderStyle="None">
              </asp:TextBox>
                                            <span />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style130">
                                        <div></div>
                                    </td>
                                    <td>
                                        <div></div>
                                    </td>
                                    <td class="auto-style9">
                                        <div
                                            class="kdot-body-text" style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                                            4.
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text">
                                            "Buy America" Materials -
              <asp:TextBox
                  ID="txtSectiontext3" runat="server" onchange="javascript:CheckScrollPosition(this);" AutoPostBack="true" CssClass="disable" ReadOnly="true" TabIndex="-1" TextMode="SingleLine" BorderStyle="None" Width="421px">
              </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style130">
                                        <div></div>
                                    </td>
                                    <td>
                                        <div></div>
                                    </td>
                                    <td class="auto-style9">
                                        <div
                                            class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            5.
                                        </div>
                                    </td>
                                    <td>
                                        <div class="auto-style131 kdot-body-text">Incorporate only tested or approved material into the project. Any work utilizing unaccepted materials will be performed at the Contractor&#39;s risk. Such material will be removed from the project or the material accepted at a reduced price at the discretion of KDOT. </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style130">
                                        <div></div>
                                    </td>
                                    <td>
                                        <div></div>
                                    </td>
                                    <td class="auto-style9">
                                        <div
                                            class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            6.
                                        </div>
                                    </td>
                                    <td>
                                        <div class="auto-style114 kdot-body-text">Use only approved aggregate in Asphalt and Concrete mixes. </div>
                                    </td>
                                </tr>
                                <tr
                                    style="min-height: 19px">
                                    <td class="auto-style130">
                                        <div></div>
                                    </td>
                                    <td>
                                        <div></div>
                                    </td>
                                    <td
                                        colspan="2">
                                        <div
                                            style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            <asp:TextBox runat="server" TabIndex="125" Rows="1" ID="txtVIIC8" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Width="613px">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style130">
                                        <div></div>
                                    </td>
                                    <td>
                                        <div></div>
                                    </td>
                                    <td class="auto-style9">
                                        <div
                                            class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            7.
                                        </div>
                                    </td>
                                    <td>
                                        <div class="auto-style114 kdot-body-text">Submit a DOT 649 for all aggregates used on the projects.</div>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <table style="border-collapse: collapse; border-spacing: 0px; font-size: 10pt; font-weight: normal;" border="0" class="auto-style128">
                            <colgroup>
                                <col />
                                <col style="width: 26px" width="26px" />
                                <col style="width: 618px" width="618px" />
                            </colgroup>
                            <tbody valign="top" style="font-family: Verdana; font-size: 10pt">
                                <tr style="min-height: 22px">
                                    <td class="auto-style27">
                                        <div></div>
                                    </td>
                                    <td
                                        style="padding-bottom: 1px; padding-top: 4px; padding-left: 1px; padding-right: 1px" class="auto-style50">
                                        <div>D.</div>
                                    </td>
                                    <td>
                                        <div
                                            style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            Stored Materials (Construction Stockpile):
              <asp:RadioButtonList
                  ID="optStoredMaterials" runat="server" onchange="javascript:optBtnCondFormat(this, 'grpStoredMaterials', 2);" AutoPostBack="false"
                  RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="126">
                  <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                  <asp:ListItem Value="2" Text="No"></asp:ListItem>
              </asp:RadioButtonList>
                                        </div>
                                        <div style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            <div align="left" style="width: 625px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px; border-collapse: collapse; border-spacing: 0px;">
                                                <asp:Panel ID="grpStoredMaterials" runat="server">
                                                    <table border="0" class=""
                                                        style="width: 622px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;">
                                                        <colgroup>
                                                            <col style="width: 26px" />
                                                            <col
                                                                style="width: 596px" />
                                                        </colgroup>
                                                        <tbody valign="top">
                                                            <tr>
                                                                <td>
                                                                    <div>
                                                                        <font
                                                                            size="2">1.</font>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div
                                                                        class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in" class="auto-style101">
                                                                        KDOT must receive the proper certifications before construction stockpile payment can be made for stored materials..
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div>
                                                                        <font
                                                                            size="2">2.</font>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div
                                                                        class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in" class="auto-style114">
                                                                        Items under $5,000.00 valuation will not be applicable.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div>
                                                                        <font
                                                                            size="2">3.</font>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div
                                                                        class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in" class="auto-style101">
                                                                        The AWP program requires a line item designation for each item of stored materials. Properly designate each line item.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div>
                                                                        <font
                                                                            size="2">4.</font>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div
                                                                        class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in" class="auto-style114">
                                                                        Paid invoices are no longer required.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div>
                                                                        <font
                                                                            size="2">5.</font>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div
                                                                        class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in" class="auto-style101">
                                                                        Only include actual material and shipment costs. Do not include testing fees, stockpiling costs, etc. Payment can only be made up to 90% of bid item.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr
                                                                style="min-height: 20px">
                                                                <td colspan="2">
                                                                    <div
                                                                        style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                                                        <asp:TextBox runat="server" TabIndex="127" ID="txtVF5" Rows="1" Width="613px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                                            Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <%--   </div>
    </td>
    </tr>--%>
                                <tr>
                                    <td class="auto-style27">
                                        <div>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 20px">
                                    <td class="auto-style27">
                                        <div>
                                        </div>
                                    </td>
                                    <td class="auto-style50">
                                        <div>
                                            E.
                                        </div>
                                    </td>
                                    <td>
                                        <div style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                            Locating and Equipping Field Labs.
                      <asp:TextBox ID="txtVG" runat="server" Rows="1" TabIndex="128" Width="615px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                          Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                      </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 54px">
                                    <td colspan="3">
                                        <div>
                                            <asp:TextBox ID="txtProjMatAdditional" runat="server" CssClass="disable autosize-grow" Height="48px" TabIndex="129"
                                                TextMode="MultiLine" Width="643px" BorderStyle="Solid" BorderWidth="1px" EnableTheming="False" Style="resize: none; overflow: hidden;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="auto-style146">
                        <span />
                    </div>
                    <ol style="margin-bottom: 0px; margin-top: 0px" type="I" start="8" ndlistnewstart="true">
                        <li style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in; font-family: Verdana; font-size: 12pt; font-weight: 400" class="auto-style58"><strong>Project Construction</strong></li>
                    </ol>
                    <div style="margin-bottom: 0pt; margin-top: 0in; padding-right: 0in">
                        <table class="" style="width: 702px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px; font-size: 10pt; font-weight: normal;" border="0">
                            <colgroup>
                                <col style="width: 41px" />
                                <col />
                                <col style="width: 35px" />
                                <col style="width: 600px" />
                            </colgroup>
                            <tbody valign="top" style="font-family: Verdana; font-size: 10pt">
                                <tr style="min-height: 19px">
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 4px; padding-left: 1px; padding-right: 1px">
                                        <div>
                                            A.
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="kdot-body-text">
                                            Surveying
                                    <asp:RadioButtonList ID="optSurveying" onchange="javascript:optBtnCondFormat(this, 'group10', 2);" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="130">
                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                    </asp:RadioButtonList>
                                        </div>
                                        <asp:Panel ID="group10" runat="server">
                                            <div class="ie-font-block" style="width: 627px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px; border-spacing: 0px; border-collapse: collapse;" align="left">
                                                <div>
                                                    <table class="" style="width: 624px; table-layout: fixed; border-spacing: 0px; border-collapse: collapse;" border="0">
                                                        <colgroup>
                                                            <col style="width: 30px" />
                                                            <col style="width: 594px" />
                                                        </colgroup>
                                                        <tbody valign="top">
                                                            <tr style="min-height: 35px">
                                                                <td style="border-bottom-color: " class="auto-style101">
                                                                    <div>
                                                                        <font size="2">1.</font>
                                                                    </div>
                                                                </td>
                                                                <td style="border-bottom-color: ">
                                                                    <div class="kdot-body-text">
                                                                        Surveying may begin before the Notice to Proceed is issued and KDOT should be notified
                                                                when this work begins.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr style="min-height: 35px">
                                                                <td style="border-bottom-color: ">
                                                                    <div class="kdot-body-text">
                                                                        <font size="2">2.</font>
                                                                    </div>
                                                                </td>
                                                                <td style="border-bottom-color: ">
                                                                    <div class="kdot-body-text">
                                                                        Prior to construction a level circuit must be completed to verify or re-establish
                                                                all plan benchmark elevations.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr style="min-height: 16px">
                                                                <td style="border-top-color: ">
                                                                    <div class="kdot-body-text">
                                                                        <font size="2">3.</font>
                                                                    </div>
                                                                </td>
                                                                <td style="border-top-color: ">
                                                                    <div class="kdot-body-text">
                                                                        All Right-of-Way &amp; Easements shall be marked, prior to any construction activity
                                                                in that area.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="border-top-color: ; border-bottom-color: ">
                                                                    <div class="kdot-body-text">
                                                                        <font size="2">4.</font>
                                                                    </div>
                                                                </td>
                                                                <td style="border-top-color: ; border-bottom-color: ">
                                                                    <div class="kdot-body-text">
                                                                        Prior to construction, submit to KDOT in a timely manner, copies of the Section
                                                                Corner Endangerment Reports that were submitted to the appropriate governmental
                                                                custodians. All monuments for the Public Land survey System must remain intact or
                                                                be professionally relocated upon completion of the project in accordance with K.S.A.
                                                                58-2011, et seq.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        <font size="2">5.</font>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        Survey Information is to remain on the project at all times.
                              <asp:TextBox runat="server" TabIndex="131" ID="txtVIIIA1" Rows="1" Width="585px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                  Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                              </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="border-top-color: ">
                                                                    <div class="kdot-body-text">
                                                                        <font size="2">6.</font>
                                                                    </div>
                                                                </td>
                                                                <td style="border-top-color: ">
                                                                    <div class="kdot-body-text">
                                                                        KDOT shall receive all survey field books, electronic as built field construction
                                                                plans, and other records upon completion and before full payment will be made.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div>
                                                    <asp:TextBox runat="server" TabIndex="132" ID="txtVIIIA7" Rows="1" Width="617px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                        Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                                    </asp:TextBox>
                                                </div>
                                                <div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr style="min-height: 19px">
                                    <td class="auto-style30">
                                        <div>
                                        </div>
                                    </td>
                                    <td class="auto-style30">
                                        <div class="kdot-body-text">
                                            B.
                                        </div>
                                    </td>
                                    <td colspan="2" class="auto-style30">
                                        <div class="kdot-body-text">
                                            Environmental
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 4px; padding-left: 1px; padding-right: 1px" class="auto-style9">
                                        <div class="kdot-body-text">
                                            1.
                                        </div>
                                    </td>
                                    <td>
                                        <div dir="ltr" class="kdot-body-text">
                                            Stormwater<asp:RadioButtonList ID="optStormwater" AutoPostBack="false" onchange="javascript:SetStormWater();" runat="server" RepeatDirection="Horizontal" CssClass="kdot-body-text">
                                                <asp:ListItem Text="No disturbance" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="&lt; one acre" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="&gt;= 1 acre KDOT" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="&gt;= 1 acre LPA" Value="4"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td class="auto-style9">
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <div class="kdot-body-text" style="width: 100%; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                <asp:Panel ID="group3" runat="server" Style="display: none">
                                                    No disturbance
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div />
                                        <asp:Panel ID="group4" runat="server">
                                            <div style="width: 595px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                <div class="auto-style114 kdot-body-text">
                                                    Less that one Acre
                                                </div>
                                                <div>
                                                    <table class="" style="width: 592px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;" border="0">
                                                        <colgroup>
                                                            <col style="width: 30px" />
                                                            <col style="width: 562px" />
                                                        </colgroup>
                                                        <tbody valign="top">
                                                            <tr>
                                                                <td>
                                                                    <div align="right" class="kdot-body-text">
                                                                        a.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        No NPDES, SWPPP, or inspection reports are required.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr style="min-height: 35px">
                                                                <td>
                                                                    <div align="right" class="kdot-body-text">
                                                                        b.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        Contractor must still comply with concepts of Erosion and Stormwater
                                                                    Pollution control.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <div align="right">
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="group5" runat="server">
                                            <div style="width: 597px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                <div>
                                                    <table class="" style="width: 594px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;" border="0">
                                                        <colgroup>
                                                            <col style="width: 30px" />
                                                            <col style="width: 564px" />
                                                        </colgroup>
                                                        <tbody valign="top">
                                                            <tr style="min-height: 22px">
                                                                <td colspan="2" style="border-bottom-color: ">
                                                                    <div class="kdot-body-text">
                                                                        >= 1 Acre KDOT
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="vertical-align: bottom; padding-bottom: 2px; padding-top: 0px; padding-left: 1px; padding-right: 1px">
                                                                    <div align="right" class="kdot-body-text">
                                                                        a.
                                                                    </div>
                                                                </td>

                                                                <td>
                                                                    <div class="custom-clearable">
                                                                        <span class="kdot-label kdot-body-text">Contractor's designated WPCM
                                                                        </span>

                                                                        <asp:TextBox ID="txtContWPCMKDOT" runat="server"
                                                                            CssClass="custom-clear-input"
                                                                            MaxLength="35"
                                                                            TabIndex="134"
                                                                            Style="margin-left: 10px; width: 185px;"
                                                                            AutoPostBack="false"
                                                                            TextMode="SingleLine"
                                                                            onchange="javascript:CheckTextBox(this,'Contractors WPCM is required.');">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>

                                                            <tr style="min-height: 19px">
                                                                <td style="vertical-align: bottom; padding-bottom: 2px; padding-top: 0px; padding-left: 1px; padding-right: 1px">
                                                                    <div align="right" class="kdot-body-text">
                                                                        b.
                                                                    </div>
                                                                </td>

                                                                <td>
                                                                    <div class="custom-clearable">
                                                                        <span class="kdot-label kdot-body-text">KDOT&#39;s designated Area/Metro Engineer
                                                                        </span>

                                                                        <asp:TextBox ID="txtMetroEngKDOT" runat="server"
                                                                            CssClass="custom-clear-input"
                                                                            MaxLength="35"
                                                                            TabIndex="135"
                                                                            Style="margin-left: 10px; width: 185px;"
                                                                            AutoPostBack="false"
                                                                            TextMode="SingleLine"
                                                                            onchange="javascript:CheckTextBox(this,'KDOTs Area/Metro Engineer is required.');">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="vertical-align: top; padding-bottom: 2px; padding-top: 4px; padding-left: 1px; padding-right: 1px">
                                                                    <div align="right" class="kdot-body-text">
                                                                        c.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        Has the Contractor's SWPPP been submitted? 
                                                                            <asp:RadioButtonList ID="optVIIIB1c" runat="server" onchange="javascript:SetRadioButton(this,'Select whether the Contractors SWPPP has been submitted or not.');" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="136">
                                                                                <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                                <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                                            </asp:RadioButtonList>

                                                                    </div>
                                                                    <div>
                                                                        <asp:TextBox ID="txtVIIIB1CKDOT" Rows="1" runat="server" onchange="javascript:CheckScrollPosition(this);" TabIndex="137" Width="555px"
                                                                            TextMode="MultiLine" CssClass="grow-textarea grow-singleline" Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid"
                                                                            BorderWidth="1px">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="vertical-align: top; padding-bottom: 2px; padding-top: 4px; padding-left: 1px; padding-right: 1px">
                                                                    <div align="right" class="kdot-body-text">
                                                                        d.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        Has the Contractor's SWPPP been approved? 
                                                                            <asp:RadioButtonList ID="optVIIIB1d" onchange="javascript:SetRadioButton(this,'Select whether the Contractors SWPPP has been approved.');" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="138">
                                                                                <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                                <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                                            </asp:RadioButtonList>

                                                                    </div>
                                                                    <div>
                                                                        <asp:TextBox ID="txtVIIIB1DKDOT" runat="server" TabIndex="139" Width="555px" TextMode="MultiLine" CssClass="animated"
                                                                            Style="overflow: auto; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Height="18px" AutoPostBack="false">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="vertical-align: top; padding-bottom: 2px; padding-top: 0px; padding-left: 1px; padding-right: 1px">
                                                                    <div align="right" class="kdot-body-text">
                                                                        e.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        KDOT and the Contractor shall schedule routine SWPPP inspections such that a
                              minimum of one inspection is performed within
                              every 7-day period. 
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="vertical-align: top; padding-bottom: 2px; padding-top: 0px; padding-left: 1px; padding-right: 1px">
                                                                    <div align="right" class="kdot-body-text">
                                                                        f.                                                                   
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        A separate storm water erosion control preconstruction conference will
                              be held for this project.
                                                                            <asp:TextBox ID="txtStormwaterPreconstConfKDOT" runat="server" AutoPostBack="false" TabIndex="140" TextMode="MultiLine"
                                                                                CssClass="animated" Width="555px" Style="overflow: auto; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Height="18px">
                                                                            </asp:TextBox>

                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr style="min-height: 20px">
                                                                <td colspan="2" style="vertical-align: bottom; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <div />
                                        <div>
                                            <asp:Panel ID="group5_2" runat="server">
                                                <div style="width: 597px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                    <div>
                                                        <table class="auto-style99" style="border-collapse: collapse; border-spacing: 0px;" border="0">
                                                            <colgroup>
                                                                <col style="width: 30px" />
                                                                <col style="width: 564px" />
                                                            </colgroup>
                                                            <tbody valign="top">
                                                                <tr style="min-height: 22px">
                                                                    <td colspan="2">
                                                                        <div class="kdot-body-text">
                                                                            <font size="2">>= 1 Acre LPA </font>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="vertical-align: bottom; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                                                        <div align="right">
                                                                            <font size="2">a.</font>
                                                                        </div>
                                                                    </td>
                                                                    <td style="border-bottom-color: ">
                                                                        <div class="custom-clearable kdot-align">
                                                                            <span class="kdot-label kdot-body-text"><font size="2">Contractor's designated WPCM</font></span>

                                                                            <asp:TextBox ID="txtContWPCMLPA"
                                                                                runat="server"
                                                                                CssClass="disable custom-clear-input"
                                                                                MaxLength="35"
                                                                                TabIndex="141"
                                                                                TextMode="SingleLine"
                                                                                AutoPostBack="false"
                                                                                onchange="javascript:CheckTextBox(this,'Contractors WPCM is required.');"
                                                                                Style="width: 185px; margin-left: 0;">
                                                                            </asp:TextBox>
                                                                        </div>

                                                                    </td>
                                                                </tr>
                                                                <tr style="min-height: 19px">
                                                                    <td style="vertical-align: bottom; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                                                        <div align="right">
                                                                            <font size="2">b.</font>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="custom-clearable kdot-align">
                                                                            <span class="kdot-label kdot-body-text"><font size="2">KDOT&#39;s designated Area/Metro Engineer</font></span>

                                                                            <asp:TextBox ID="txtMetroEngLPA"
                                                                                runat="server"
                                                                                CssClass="disable custom-clear-input"
                                                                                MaxLength="35"
                                                                                TabIndex="142"
                                                                                TextMode="SingleLine"
                                                                                AutoPostBack="false"
                                                                                onchange="javascript:CheckTextBox(this,'KDOTs Area/Metro Engineer is required.');"
                                                                                Style="width: 185px; margin-left: 10px;">
                                                                            </asp:TextBox>
                                                                        </div>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 3px; padding-left: 1px; padding-right: 1px">
                                                                        <div align="right">
                                                                            <font size="2">c.</font>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div>
                                                                            <font size="2">Has the Contractor's SWPPP been submitted? </font><font size="2">
                                                                                <asp:RadioButtonList ID="optVIIIB1ea" onchange="javascript:SetRadioButton(this,'Select whether the Contractors SWPPP has been submitted or not.');" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="143">
                                                                                    <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                                    <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                            </font>
                                                                        </div>
                                                                        <div>
                                                                            <asp:TextBox runat="server" TabIndex="144" ID="txtVIIIB1CLPA" Width="555px" TextMode="MultiLine" CssClass="animated"
                                                                                Style="overflow: auto; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Height="18px">
                                                                            </asp:TextBox>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 4px; padding-left: 1px; padding-right: 1px">
                                                                        <div align="right">
                                                                            <font size="2">d.</font>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div>
                                                                            <font size="2">Has the Contractor's SWPPP been approved? </font><font size="2">
                                                                                <asp:RadioButtonList ID="optVIIIB1eb" onchange="javascript:SetRadioButton(this,'Select whether the Contractors SWPPP has been approved or not.');" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="145">
                                                                                    <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                                    <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                            </font>
                                                                        </div>
                                                                        <div>
                                                                            <asp:TextBox TabIndex="146" runat="server" ID="txtVIIIB1DLPA" Width="555px" TextMode="MultiLine" CssClass="animated"
                                                                                Style="overflow: auto; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Height="18px">
                                                                            </asp:TextBox>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 0px; padding-left: 1px; padding-right: 1px" class="auto-style92">
                                                                        <div align="right">
                                                                            <font size="2">e.</font>
                                                                        </div>
                                                                    </td>
                                                                    <td class="auto-style92">
                                                                        <div>
                                                                            <font size="2">KDOT and the Contractor shall schedule routine SWPPP inspections such that a
                                                                    minimum of one inspection is performed within
                                                                    every 7-day period. </font>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr style="min-height: 41px">
                                                                    <td style="vertical-align: top; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px">
                                                                        <div align="right">
                                                                            <font size="2">f.</font>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div>
                                                                            <font size="2">A separate storm water erosion control preconstruction conference will
                                                                    be held for this project.
                                        <asp:TextBox ID="txtStormwaterPreconstConfLPA" runat="server" onchange="javascript:CheckScrollPosition(this);" AutoPostBack="true"
                                            TabIndex="147" CssClass="disable animated" Width="555px" TextMode="MultiLine" Style="overflow: auto; resize: none;" BorderColor="#CCCCCC"
                                            BorderStyle="Solid" BorderWidth="1px" Height="18px">
                                        </asp:TextBox>
                                                                            </font>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr style="min-height: 20px">
                                                                    <td colspan="2" style="border-top-color: ; vertical-align: bottom; padding-bottom: 1px; padding-top: 1px; padding-left: 1px; padding-right: 1px"></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                        <div />
                                        <div>
                                            <asp:TextBox runat="server" TabIndex="148" ID="txtVIIIB1" Rows="1" Width="588px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                            </asp:TextBox>
                                        </div>
                                        <div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 4px; padding-left: 1px; padding-right: 1px" class="auto-style9">
                                        <div>
                                            2.
                                        </div>
                                    </td>
                                    <td>
                                        <div class="kdot-body-text">
                                            Environment Protection.
                                    <asp:RadioButtonList ID="optEnvProtection" onchange="javascript: optBtnCondFormat(this, 'group11', 2);" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="149">
                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                    </asp:RadioButtonList>
                                        </div>
                                        <asp:Panel ID="group11" runat="server">
                                            <div style="padding: 0px; margin: 0px;" align="left" class="auto-style151">
                                                <div>
                                                    <div class="auto-style120 kdot-body-text">
                                                        If applicable, an environmental packet containing permits from the following agencies
                                                will be on file at the District Office and the Area Office.
                                                    </div>
                                                </div>
                                                <div class="kdot-body-text">
                                                    <span />
                                                    <asp:CheckBox ID="chkVI6DOD" runat="server" Text=" " TabIndex="150" />
                                                    Department of the Army
                                                </div>
                                                <div class="kdot-body-text">
                                                    <asp:CheckBox ID="chkVI6Ag" runat="server" Text=" " TabIndex="151" />
                                                    Kansas State Board of Agriculture
                                                </div>
                                                <div class="kdot-body-text">
                                                    <asp:CheckBox ID="chkVI6KCC" runat="server" Text=" " TabIndex="152" />
                                                    Kansas Corporation Commission
                                                </div>
                                                <div class="kdot-body-text">
                                                    <asp:CheckBox ID="chkVI6Parks" runat="server" Text=" " TabIndex="153" />
                                                    Kansas Department of Wildlife and Parks
                                                </div>
                                                <div class="kdot-body-text">
                                                    <asp:CheckBox ID="chkVI6KDHE" runat="server" Text=" " TabIndex="154" />
                                                    Department of Health and Environment
                                                </div>
                                                <div class="kdot-body-text">
                                                    <asp:CheckBox ID="chkVI6KHS" runat="server" Text=" " TabIndex="155" />
                                                    Kansas Historical Society
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 4px; padding-left: 1px; padding-right: 1px">
                                        <div class="kdot-body-text">
                                            C.
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="kdot-body-text">
                                            Grading
                      <asp:TextBox runat="server" AutoPostBack="false" TabIndex="0" TextMode="SingleLine" CssClass="disable" ID="txtGrading"
                          BorderStyle="None" Height="16px">
                      </asp:TextBox>
                                            <asp:RadioButtonList ID="optGrading" onchange="javascript: optBtnCondFormat(this, 'grpGrading', 2);optBtnCondFormat(this, 'txtGrading', 1);" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" Style="font-size: 10pt; font-weight: normal;">
                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <asp:Panel ID="grpGrading" runat="server">
                                            <div style="width: 634px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                <div>
                                                    <table class="" style="width: 631px; table-layout: fixed; border-spacing: 0px; border-collapse: collapse;" border="0">
                                                        <colgroup>
                                                            <col style="width: 29px" />
                                                            <col style="width: 602px" />
                                                        </colgroup>
                                                        <tbody valign="top">
                                                            <tr>
                                                                <td>
                                                                    <div align="left" class="kdot-body-text">
                                                                        1.
                                                                    </div>
                                                                    <div>
                                                                        <div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="auto-style124 kdot-body-text">
                                                                        Borrow/Waste Area - The Contractor is responsible for obtaining all clearances,
                                                                    permits, and licenses for borrow and waste areas. Copies of these must be submitted
                                                                    to KDOT before the areas are used.
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div align="left" class="kdot-body-text">
                                                                        2.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        Is the Contractor accepting plan volumes for Contractor Furnished Excavation
                                                                    plus or minus known changes?
                                                                    </div>
                                                                    <div>
                                                                        <div>
                                                                            <asp:RadioButtonList ID="optPlanQty"
                                                                                onchange="javascript:SetRadioButton1(optPlanQty, 'Select whether or not the Contractor is accepting plan quantity for Contractor Furnished Excavation.');optBtnCondFormat(this,'group7',0);"
                                                                                runat="server" AutoPostBack="false" RepeatDirection="Horizontal" CssClass="kdot-body-text" TabIndex="156">
                                                                                <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                                <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                                                <asp:ListItem Value="3" Text="N/A"></asp:ListItem>
                                                                            </asp:RadioButtonList>
                                                                        </div>
                                                                    </div>
                                                                    <asp:Panel ID="group7" runat="server">
                                                                        <div style="width: 590px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                                            <div class="kdot-body-text">Original cross sections must be submitted by the Contractor for calculation of Contractor Furnished Excavation.</div>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr style="min-height: 22px">
                                                                <td colspan="2">
                                                                    <div align="left">
                                                                        <asp:TextBox runat="server" TabIndex="157" ID="txtVIIIC" Rows="1" Width="622px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                                            Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 3px; padding-left: 1px; padding-right: 1px">
                                        <div>
                                            D.
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="kdot-body-text">
                                            Asphalt Paving
                                    <asp:TextBox ID="txtAsphPaving" runat="server" AutoPostBack="false" TabIndex="0" TextMode="SingleLine" Style="vertical-align: bottom"
                                        CssClass="disable no-clear" BorderStyle="None" Height="16px" Width="150px">
                                        (Not Applicable)</asp:TextBox>
                                            <asp:RadioButtonList ID="optAsphPaving" onchange="javascript:optBtnCondFormat(this,'group16',2);optBtnCondFormat(this,'txtAsphPaving',1);" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" Style="font-size: 10pt; font-weight: normal;" TabIndex="158">
                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                        <asp:Panel ID="group16" runat="server">
                                            <div style="margin-bottom: 6px; width: 100%; padding-left: 1px" align="left">
                                                <div class="kdot-body-text">
                                                    1. QC/QA HMA
                                            <asp:RadioButtonList ID="optQC" CssClass="kdot-body-text" onchange="javascript:SetRadioButton(this,'Select whether QC/QA HMA is applicable or not.');optBtnCondFormat(this,'group23',2);optBtnCondFormat(this,'sectionQC',2);" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="159">
                                                <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                            </asp:RadioButtonList>
                                                    <asp:Panel Visible="true" ID="group23" runat="server">
                                                        <div class="kdot-body-text">
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Has the Contractor Submitted a QC/QA plan for Approval?
                                            <asp:RadioButtonList ID="optQCSubmitted" onchange="javascript:SetRadioButton(this,'Contractor QC/QA Submitted for Approval Question Required.');optBtnCondFormat(this,'group21',2);" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="160">
                                                <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                            </asp:RadioButtonList>
                                                        </div>
                                                        <asp:Panel ID="group21" CssClass="kdot-body-text" runat="server" Height="50px">
                                                            <br />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; KDOT will provide the Contractor with the F&amp;T Spreadsheet for the project. The pay
                              <br />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; results from this spreadsheet will be shared daily between the Department and the
                              <br />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contractor.
                             <div>
                                 <br />
                             </div>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                </div>
                                                <asp:Panel ID="sectionQC" runat="server">
                                                    <div style="width: 100%; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                        <div>
                                                            <div title="" class="xdSection xdRepeating" style="width: 100%; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left" xd:xctname="Section" xd:ctrlid="CTRL814" tabindex="-1" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://schemas.microsoft.com/office/infopath/2003">
                                                                <div class="kdot-body-text">Which of the first 2 lots does the Contractor want to be subject to density pay adjustment?  KDOT must be informed of this decision prior to the Contractor starting production.</div>
                                                                <div>
                                                                    <div>
                                                                        <asp:RadioButtonList ID="optLotID" onchange="javascript:SetRadioButton(this,'You must select which lots the QC/QA HMA applies to.');" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" TabIndex="161" CssClass="kdot-body-text">
                                                                            <asp:ListItem Value="1" Text="Both Lots 1&2"></asp:ListItem>
                                                                            <asp:ListItem Value="2" Text="Only Lot 2"></asp:ListItem>
                                                                            <asp:ListItem Value="3" Text="None"></asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <br />
                                                <div>
                                                    <div style="width: 630px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                        <asp:Panel ID="grpAsphPaving" runat="server">
                                                            <table class="" style="width: 627px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;" border="0">
                                                                <colgroup>
                                                                    <col style="width: 31px" />
                                                                    <col style="width: 596px" />
                                                                </colgroup>
                                                                <tbody valign="top">
                                                                    <tr>
                                                                        <td>
                                                                            <div class="kdot-body-text">
                                                                                2.
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="kdot-body-text">
                                                                                Contractor is to schedule operations to minimize hauling over the surface
                                                                    course.
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <div>
                                                                                <asp:TextBox runat="server" TabIndex="162" ID="txtVIIID1" Rows="1" Width="619px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                                                    Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                                                                </asp:TextBox>
                                                                            </div>
                                                                            <div>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </asp:Panel>
                                                        <div />
                                                        <div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 3px; padding-left: 1px; padding-right: 1px">
                                        <div>
                                            E.
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="kdot-body-text">
                                            Concrete Paving&nbsp;<asp:TextBox runat="server" AutoPostBack="false" TabIndex="0" TextMode="SingleLine"
                                                CssClass="disable" ID="txtConcPaving" BorderStyle="None" Height="16px"></asp:TextBox>
                                            <asp:RadioButtonList ID="optConcPaving" onchange="javascript:optBtnCondFormat(this,'optQCQASubmitted',2);optBtnCondFormat(this,'grpConcPaving',2);optBtnCondFormat(this,'txtConcPaving',1);" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" Style="font-size: 10pt; font-weight: normal;" TabIndex="163">
                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                        <asp:Panel runat="server" ID="optQCQASubmitted">
                                            <div class="auto-style30">
                                                &nbsp;&nbsp;&nbsp; Has the Contractor Submitted a QC/QA plan for Approval?
                    <asp:RadioButtonList runat="server" ID="optConcPavQCSub" onchange="javascript:SetRadioButton(this,'Contractor QC/QA Submitted for Approval Question Required.');" RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="false" TabIndex="164">
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="grpConcPaving" runat="server">
                                            <div style="width: 630px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                <div>
                                                    <table class="" style="width: 626px; table-layout: fixed; border-spacing: 0px; border-collapse: collapse;" border="0">
                                                        <colgroup>
                                                            <col style="width: 35px" />
                                                            <col style="width: 591px" />
                                                        </colgroup>
                                                        <tbody valign="top">
                                                            <tr style="min-height: 42px">
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        1.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                                                        Properly handle and store all rebar on the project site. Store it on pallets off
                                                                the ground. Cover epoxy coated steel with opaque material immediately upon delivery,
                                                                unless it is placed as soon as it arrives. 
                                <asp:TextBox runat="server" TabIndex="165" ID="txtVIIID2" Rows="1" Width="584px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                    Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Height="18px">
                                </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr style="min-height: 42px">
                                                                <td colspan="2">
                                                                    <div>
                                                                        <asp:TextBox runat="server" TabIndex="166" ID="txtVIIIE1" Rows="1" Width="619px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                                            Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                    <div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </asp:Panel>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td style="padding-bottom: 1px; padding-top: 4px; padding-left: 1px; padding-right: 1px">
                                        <div>
                                            F.
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="kdot-body-text">
                                            Structures
                                    <asp:TextBox runat="server" AutoPostBack="false" TabIndex="0" TextMode="SingleLine"
                                        CssClass="disable" ID="txtStructures" BorderStyle="None">
                                    </asp:TextBox>
                                            <%-- <strong /><span />--%>
                                            <asp:RadioButtonList ID="optStructures" onchange="javascript:optBtnCondFormat(this,'grpStructureDetail',2);optBtnCondFormat(this,'txtStructures',1);" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" Style="font-size: 10pt; font-weight: normal;" TabIndex="167">
                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                            </asp:RadioButtonList>
                                            <%-- </span></strong>--%>
                                        </div>
                                        <div>
                                            <div style="width: 633px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                <asp:Panel ID="grpStructureDetail" runat="server" Style="font-size: 10pt; font-weight: normal;">
                                                    <table class="" style="width: 630px; table-layout: fixed; border-spacing: 0px; border-collapse: collapse;" border="0">
                                                        <colgroup>
                                                            <col style="width: 35px" />
                                                            <col style="width: 595px" />
                                                        </colgroup>
                                                        <tbody valign="top">
                                                            <tr style="min-height: 20px">
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        1.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="auto-style116 kdot-body-text">
                                                                        Dual Checking of Critical Bridge Elements
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <ol style="margin-bottom: 0px; margin-top: 0px" type="a">
                                                                        <li class="kdot-body-text">Project and Critical Bridge Element control points must be set under the supervision
                                                                    of a Licensed Professional Land Surveyor. </li>
                                                                        <li class="kdot-body-text">Prior to construction of Critical Bridge Elements, project and Critical Bridge element
                                                                    control points must be checked by a separate independent survey. The second survey
                                                                    is to be performed by a different Licensed Professional Land Surveyor with their
                                                                    own unique second set of notes. </li>
                                                                        <li class="auto-style122 kdot-body-text">After each element is constructed a licensed Professional Land Surveyor must verify
                                                                    the location and elevation of the Critical Bridge Element.</li>
                                                                    </ol>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding-bottom: 1px; padding-top: 4px; padding-left: 1px; padding-right: 1px">
                                                                    <div class="kdot-body-text">
                                                                        2.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="auto-style68 Falsework ✕">
                                                                        Falsework
                                <asp:TextBox ID="txtFalsework" runat="server" AutoPostBack="false" CssClass="disable" TabIndex="0" TextMode="SingleLine" BorderStyle="None"></asp:TextBox>
                                                                        <%-- <strong /><span />--%>
                                                                        <asp:RadioButtonList ID="optFalsework" CssClass="kdot-body-text" onchange="javascript:SetFalsework(this);" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" Style="font-size: 10pt; font-weight: normal;" TabIndex="168">
                                                                            <asp:ListItem Text="Category 1" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="Category 2" Value="2"></asp:ListItem>
                                                                            <asp:ListItem Text="Both" Value="3"></asp:ListItem>
                                                                            <asp:ListItem Text="NA" Value="4"></asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                        <%--</span></strong>--%>
                                                                    </div>
                                                                    <asp:Panel Visible="true" ID="grpFalseworkCat1" runat="server">
                                                                        <div style="width: 589px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                                            <div class="kdot-body-text">Cat 1 - Submit to the Engineer for review by the State Bridge Office (or Bureau of Local Projects) and, if applicable, the railroad company, 7 copies of detailed falsework plans designed and sealed by a Professional Engineer on the Category 1 structures listed below.</div>
                                                                            <div>
                                                                                <span>
                                                                                    <asp:TextBox ID="txtVIIIF2Cat1" AutoPostBack="false" runat="server" TabIndex="169" Width="585px"
                                                                                        TextMode="MultiLine" CssClass="grow-textarea grow-singleline" Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC"
                                                                                        BorderStyle="Solid" BorderWidth="1px" Rows="1">
                                                                                    </asp:TextBox>
                                                                                </span>
                                                                            </div>
                                                                            <div></div>
                                                                        </div>
                                                                    </asp:Panel>
                                                                    <asp:Panel ID="grpFalseworkCat2" runat="server">
                                                                        <div style="width: 100%; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                                            <div class="kdot-body-text">Cat 2 - Submit to the Engineer for review by the Field Engineer, 3 copies of detailed falsework plans designed and sealed by a Professional Engineer on the Category 2 structures listed below.</div>
                                                                            <div>
                                                                                <span>
                                                                                    <asp:TextBox ID="txtVIIIF2" runat="server" onchange="javascript:CheckScrollPosition(this);" TabIndex="170" Width="585px"
                                                                                        TextMode="MultiLine" CssClass="animated" Style="overflow: auto; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid"
                                                                                        BorderWidth="1px" Height="18px">
                                                                                    </asp:TextBox>
                                                                                </span>
                                                                            </div>
                                                                            <div></div>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding-bottom: 1px; padding-top: 4px; padding-left: 1px; padding-right: 1px">
                                                                    <div class="kdot-body-text">
                                                                        3.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        Controlled Demolition
                                                                <asp:RadioButtonList ID="optContDemoSuper" CssClass="kdot-body-text" onchange="javascript:optBtnCondFormat(this,'grpControlDemo',2);" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="171">
                                                                    <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                    <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                                    </div>
                                                                    <asp:Panel ID="grpControlDemo" runat="server" Style="font-size: 10pt; font-weight: normal;">
                                                                        <div class="auto-style76 kdot-body-text" style="padding: 0px; margin: 0px;" align="left">
                                                                            <div>
                                                                                <asp:CheckBox ID="chkControlDemoCatA" runat="server" onchange="javascript:ChkBoxCondFormat('chkControlDemoCatA','sectCat1',2);" AutoPostBack="false" Text=" " TabIndex="172" />

                                                                                Category A
                                                                            </div>
                                                                            <asp:Panel ID="sectCat1" runat="server">
                                                                                <br />
                                                                                <div style="padding: 0px; margin-bottom: 6px; margin-left: 25px;" align="left" class="auto-style152">
                                                                                    <div class="kdot-body-text">
                                                                                        <span>For each structure in the category provide the Field Engineer with one set of demolition plans which meet the requirements of Section 702, Controlled demolition prior to demolition and hold a pre-demolition meeting to discus this plan.</span>
                                                                                    </div>
                                                                                </div>
                                                                            </asp:Panel>
                                                                            <div>
                                                                                <asp:CheckBox ID="chkControlDemoCatB" onchange="javascript:ChkBoxCondFormat('chkControlDemoCatB','sectCatB',2);" runat="server" AutoPostBack="false" Text=" " TabIndex="173" />

                                                                                Category B
                                                                            </div>
                                                                            <asp:Panel ID="sectCatB" runat="server">
                                                                                <br />
                                                                                <div style="padding: 0px; margin-bottom: 6px; margin-left: 25px;" align="left">
                                                                                    <div>
                                                                                        <div><span>For each structure in the category provide the Field Engineer with one set of demolition plans which meet the requirements of Section 702, Controlled Demolition at least 2 weeks prior to demolition and hold a pre-demolition meeting to discuss this plan.</span></div>
                                                                                    </div>
                                                                                    <div></div>
                                                                                    <div>
                                                                                        <span>Provide a Controlled Demolitions Supervisor prequalified in accordance with Section 702.</span>
                                                                                    </div>
                                                                                    <div style="font-size: 10pt; font-weight: normal;">
                                                                                        Contractor's Demolition Supervisor: <span>
                                                                                            <asp:TextBox ID="txtCatBSupervisor" runat="server" onchange="javascript:CheckTextBox(this,'Enter the Contractors Demolition Supervisor for Category B.',true);" AutoPostBack="false" TabIndex="174" TextMode="SingleLine" CssClass="disable" Width="301px" Style="border-bottom: 1px solid;" BorderStyle="None"></asp:TextBox>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                            </asp:Panel>
                                                                            <div>
                                                                                <asp:CheckBox ID="chkControlDemoCatC" runat="server" onchange="javascript:ChkBoxCondFormat('chkControlDemoCatC','sectCatC',2);" AutoPostBack="false" Text=" " TabIndex="175" />

                                                                                Category C
                                                                            </div>
                                                                            <asp:Panel ID="sectCatC" runat="server" Style="font-size: 10pt; font-weight: normal;">
                                                                                <br />
                                                                                <div title="" class="auto-style152" style="padding: 0px; margin-bottom: 6px; margin-left: 25px;" align="left">
                                                                                    <div>
                                                                                        <div style="font-size: 10pt; font-weight: normal;">
                                                                                            <span>For each structure in the category submit 5 copies of the demolition plan which meets the requirements of Section 702, Controlled Demolition to the State Bridge Office at least 4 weeks prior to demotion and hold a pre-demolition meeting to discuss this plan.</span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div></div>
                                                                                    <div class="auto-style36">
                                                                                        <span style="font-size: 10pt; font-weight: normal;">Provide a Controlled Demolitions Supervisor prequalified in accordance with Section 702.</span>
                                                                                    </div>
                                                                                    <div>
                                                                                        Contractor's Demolition Supervisor: <span>
                                                                                            <asp:TextBox ID="txtCntrlDemoSuper" runat="server" onchange="javascript:CheckTextBox(this,'Enter the Contractors Demolition Supervisor for Category C.',true);" AutoPostBack="false" TabIndex="176" TextMode="SingleLine" CssClass="disable" MaxLength="35" Width="286px" Style="border-bottom: 1px solid;" BorderStyle="None"></asp:TextBox>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div></div>
                                                                                </div>
                                                                            </asp:Panel>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding-bottom: 1px; padding-top: 4px; padding-left: 1px; padding-right: 1px">
                                                                    <div class="kdot-body-text">
                                                                        4.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        Field Erection Supervisor
                                                               <%-- <strong /><span />--%>
                                                                        <asp:TextBox ID="txtFieldErecSuper" runat="server" AutoPostBack="false" CssClass="disable" TabIndex="0" TextMode="SingleLine" BorderStyle="None" Height="16px"></asp:TextBox>
                                                                        <asp:RadioButtonList ID="optFieldErecSuper" onchange="javascript:optBtnCondFormat(this, 'txtFieldErecSuper', 1);optBtnCondFormat(this, 'grpFieldErect', 2);SetRadioButton(optFieldErecSuper, 'Select whether or not there is a field erection supervisor.');" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" Style="font-size: 10pt; font-weight: normal;" TabIndex="177">
                                                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                        <%--</span></strong>--%>
                                                                    </div>
                                                                    <asp:Panel ID="grpFieldErect" runat="server">
                                                                        <div class="kdot-body-text" style="width: 590px;" align="left">
                                                                            Field Erection Supervisors must be prequalified in accordance with
                                  <asp:TextBox ID="txtSectiontext4" runat="server" AutoPostBack="false" TabIndex="-1" TextMode="SingleLine" CssClass="disable" ReadOnly="true" BorderStyle="None" Width="541px"></asp:TextBox>
                                                                            Contractor's Field Erection Supervisor: 
                                                                            <div class="input-container">
                                                                                <asp:TextBox ID="txtFieldErectSuper" runat="server" TabIndex="178" TextMode="Singleline" CssClass="disable textbox-with-clear" MaxLength="35" Width="267px" BorderStyle="none" Style="border: unset; border-bottom: solid; border-width: 1px"></asp:TextBox>
                                                                            </div>
                                                                            <div></div>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding-bottom: 1px; padding-top: 4px; padding-left: 1px; padding-right: 1px">
                                                                    <div class="kdot-body-text">
                                                                        5.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        Drilled Shafts
                                                                <asp:TextBox runat="server" AutoPostBack="false" TabIndex="0" TextMode="SingleLine"
                                                                    CssClass="disable" ID="txtDrilledShafts" BorderStyle="None">
                                                                </asp:TextBox>
                                                                        <%--<strong /><span />--%>
                                                                        <asp:RadioButtonList ID="optDrilledShafts" onchange="javascript:SetRadioButton(this, 'Select whether or not there are drilled shafts.');optBtnCondFormat(this,'txtDrilledShafts',1);optBtnCondFormat(this,'grpDrilledShafts',2);" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" Style="font-size: 10pt; font-weight: normal;" TabIndex="179">
                                                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                        <%-- </span></strong>--%>
                                                                    </div>
                                                                    <asp:Panel ID="grpDrilledShafts" runat="server">
                                                                        <div style="height: 34px; width: 587px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                                            <div class="kdot-body-text">A pre-drilled shaft meeting will be held shortly before the construction of the drilled shafts.</div>
                                                                            <div></div>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        6.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                                                        Properly handle and store all rebar on the project site. Store it on pallets off
                                                                the ground. Cover epoxy coated steel with opaque material immediately upon delivery,
                                                                unless it is placed as soon as it arrives. 
                                <asp:TextBox runat="server" TabIndex="180" ID="txtVIIIF6" Width="586px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline" Style="overflow: hidden; resize: none;"
                                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Rows="1">
                                </asp:TextBox>
                                                                    </div>
                                                                    <!--EndFragment-->
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="kdot-body-text">
                                                                        7.
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="kdot-body-text" style="margin-bottom: 0pt; padding-left: 0in; margin-top: 0in; padding-right: 0in">
                                                                        Water can only be added to concrete trucks by calibrated device or buckets and only when allowed by specification.
                                                                    </div>
                                                                    <!--EndFragment-->
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <div>
                                                                        <asp:TextBox runat="server" TabIndex="181" ID="txtVIIIF" Width="621px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                                            Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Rows="1">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            G.
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="kdot-body-text">
                                            Haul Roads
                                    <asp:RadioButtonList ID="optHaulRoads" runat="server" onchange="javascript:optBtnCondFormat(this,'group8',2)" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="182">
                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                    </asp:RadioButtonList>
                                        </div>
                                        <div>
                                            <div style="width: 627px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; margin: 0px; padding-right: 0px" align="left">
                                                <asp:Panel ID="group8" runat="server">
                                                    <table class="" style="width: 624px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;" border="0">
                                                        <colgroup>
                                                            <col style="width: 33px" />
                                                            <col style="width: 591px" />
                                                        </colgroup>
                                                        <tbody valign="top">
                                                            <tr>
                                                                <td>
                                                                    <div>
                                                                        <font size="2" face="Verdana">1.</font>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="auto-style114 kdot-body-text">
                                                                        What haul roads will be used for this project?
                                                                    </div>
                                                                    <div>
                                                                        <asp:TextBox ID="txtVIIIG" runat="server" AutoPostBack="False" TabIndex="183" Width="589px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                                            Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Rows="1">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div>
                                                                        <font size="2" face="Verdana">2.</font>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="auto-style114 kdot-body-text">
                                                                        How will their condition be documented?
                                                                    </div>
                                                                    <div>
                                                                        <asp:TextBox ID="txtVIIIG2" runat="server" AutoPostBack="False" TabIndex="184" Width="589px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                                            Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Rows="1">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 137px">
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            H.
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="auto-style126 kdot-body-text">
                                            Extra work will be performed according to Standard Specifications. Extra work shall
                                    not be started before approval is given by KDOT. The Contractor shall make a written
                                    request to this office if they feel they are entitled to additional compensation
                                    for extra work, <strong style="font-size: 10pt; font-weight: bold;">prior to starting this work</strong>. Any requests for additional
                                    compensation which KDOT cannot verify the costs for labor, equipment, and materials
                                    will not be considered. Equipment rates need to be approved before extra work begins.
                                        </div>
                                        <div>
                                            <asp:TextBox ID="txtVIIIH" runat="server" AutoPostBack="False" TabIndex="185" Width="620px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Rows="1">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style93">
                                        <div>
                                        </div>
                                    </td>
                                    <td class="auto-style93">
                                        <div>
                                            I.
                                        </div>
                                    </td>
                                    <td colspan="2" class="auto-style93">
                                        <div class="kdot-body-text">
                                            Construction Requirements special to the project
                                        </div>
                                        <div>
                                            <asp:TextBox ID="txtVIIII" runat="server" TabIndex="186" Width="620px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Rows="1"
                                                AutoPostBack="False">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style93">
                                        <div>
                                        </div>
                                    </td>
                                    <td class="auto-style93">
                                        <div>
                                            J.
                                        </div>
                                    </td>
                                    <td colspan="2" class="auto-style93">
                                        <div class="kdot-body-text">
                                            Project related questions/answers that were submitted through Bid Express website.
                                        </div>
                                        <div>
                                            <asp:TextBox ID="txtVIIIJ1"
                                                onchange="javascript:CheckTextBox(this,'Project related questions/answers that were subitted through Bid Express website are required');"
                                                runat="server" TabIndex="187" Rows="1" Width="620px" TextMode="MultiLine" Style="resize: none; overflow: hidden" CssClass="disable grow-textarea grow-singleline"
                                                BorderStyle="None" BorderWidth="1px" AutoPostBack="false">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            K.
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="kdot-body-text">
                                            Partnering
                                        </div>
                                        <div>
                                            <table class="" style="width: 636px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px;" border="0">
                                                <colgroup>
                                                    <col style="width: 31px" />
                                                    <col style="width: 605px" />
                                                </colgroup>
                                                <tbody valign="top" style="font-family: Verdana; font-size: 10pt">
                                                    <tr style="min-height: 42px">
                                                        <td>
                                                            <div>
                                                                <font size="2" face="Verdana">1.</font>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="kdot-body-text">
                                                                Partnering Objectives:
                                                            </div>
                                                            <div>
                                                                <asp:TextBox ID="txtVIIIK1" runat="server" AutoPostBack="False" TabIndex="188" Width="589px" TextMode="MultiLine"
                                                                    CssClass="grow-textarea grow-singleline" Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid"
                                                                    BorderWidth="1px" Rows="1">
                                                                </asp:TextBox>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                <font size="2" face="Verdana">2.</font>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="kdot-body-text">
                                                                Construction Job Site Conferences:
                                                            </div>
                                                            <div>
                                                                <asp:TextBox ID="txtVIIIK2" runat="server" AutoPostBack="False" TabIndex="189" Width="589px" TextMode="MultiLine"
                                                                    CssClass="grow-textarea grow-singleline" Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid"
                                                                    BorderWidth="1px" Rows="1">
                                                                </asp:TextBox>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                <font size="2" face="Verdana">3.</font>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="kdot-body-text">
                                                                Project Partnering Conference
                                                                    <asp:RadioButtonList ID="optVIIIK3" runat="server" onchange="SetRadioButton(this,'Select whether there will be a project partnering conference or not.');" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="190">
                                                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                        <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                                    </asp:RadioButtonList>

                                                            </div>
                                                            <div>
                                                                <asp:TextBox ID="txtVIIIK3" runat="server" AutoPostBack="false" TabIndex="191" Width="589px" TextMode="MultiLine"
                                                                    CssClass="grow-textarea grow-singleline" Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid"
                                                                    BorderWidth="1px" Rows="1">
                                                                </asp:TextBox>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                <font size="2" face="Verdana">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.</font>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="kdot-body-text">
                                                                Specific Partnering Issues:
                                                            </div>
                                                            <div>
                                                                <asp:TextBox ID="txtVIIIK4" runat="server" AutoPostBack="false" TabIndex="192" Width="589px" TextMode="MultiLine"
                                                                    CssClass="grow-textarea grow-singleline" Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid"
                                                                    BorderWidth="1px" Rows="1">
                                                                </asp:TextBox>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="min-height: 54px">
                                    <td colspan="4">
                                        <div>
                                            <asp:TextBox ID="txtProjectConstruction" runat="server" AutoPostBack="false" TabIndex="193" Width="646px" class="auto-style19"
                                                BorderStyle="Solid" BorderWidth="1pt" Height="47px" TextMode="MultiLine" CssClass="auto-style24 animated" Style="resize: none;">
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="auto-style30">
                                        <div style="font-family: Verdana; font-size: 12pt; font-weight: 600">
                                            IX. General Discussion
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td style="padding-top: 5px">A.</td>
                                    <td colspan="2" valign="top">
                                        <div class="kdot-body-text">
                                            Logo signs                                
                                <asp:TextBox ID="txtLogoSigns" runat="server" AutoPostBack="false" CssClass="disable" TabIndex="0" TextMode="SingleLine" BorderStyle="None"></asp:TextBox>
                                            <asp:RadioButtonList ID="optLogoSigns" runat="server" onchange="javascript:optBtnCondFormat(this,'grpLogo',2);optBtnCondFormat(this,'txtLogoSigns',1);" AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="194">
                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                        <asp:Panel ID="grpLogo" runat="server" Style="font-size: 10pt; font-weight: normal;">
                                            <div class="kdot-body-text">
                                                Logo signs are not KDOT property. They are owned by the company advertising and they pay rent to KDOT through our Contractor, Kansas Logos, Inc. The following information is included on standard plan sheet TE402. Contractors need to be aware of their responsibility to contact Kansas Logos, Inc 
                    <div>
                    </div>
                                            </div>
                                            <br />
                                            <div class="kdot-body-text">
                                                &quot;The Contractor will notify Kansas Logos, Inc. at 1-800-449-4420 one week in advance of when the logo panels need to be removed from the sign structure. Kansas Logos, Inc. will remove, store and reinstall the logo panels upon completion of construction. If Kansas Logos, Inc. does not remove the logo panels within one week of notice, the Contractor will remove the logo panels and take reasonable care of them until Kansas Logos, Inc. can retrieve the logo panels.&quot;
                        <div />
                                                <font size="3"></font>
                                            </div>
                                            <br />
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>B.</td>
                                    <td colspan="2"><strong /><span />
                                        <div class="kdot-body-text">
                                            Special Provisions of Note <strong /><span />
                                            <asp:TextBox ID="txtIXB" runat="server" TabIndex="195" Width="624px" TextMode="MultiLine" CssClass="grow-textarea grow-singleline"
                                                Style="overflow: hidden; resize: none;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Rows="1">
                                            </asp:TextBox>
                                            <font size="3"></font>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>C.</td>
                                    <td colspan="2"><strong /><span />
                                        <div class="kdot-body-text">
                                            Reminder for KDOT to input project description and any restrictions into KSCARS Program.<span />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="3"><%--<strong /><span />--%>
                                        <asp:TextBox ID="txtIXAdditional" runat="server" BorderStyle="Solid" BorderWidth="1pt" Height="54px" TabIndex="196"
                                            TextMode="MultiLine" Width="652px" CssClass="animated" Style="resize: none;">
                                        </asp:TextBox>
                                        <%-- </strong>--%></td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <div class="auto-style51 kdot-body-text">
                                            Meeting adjourned at:
                                            <div class="input-container">
                                                <asp:TextBox ID="txtMtgAdjourned" onchange="javascript:CheckScrollPosition(this);" runat="server" AutoPostBack="true" onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90) || (event.keyCode==80 || event.keyCode==65 || event.keyCode==77));" CssClass="disable textbox-with-clear" TabIndex="197" TextMode="SingleLine" Width="145px" Style="border-bottom: 1px; border-top: 0px; border-right: 0px; border-left: 0px; border-style: solid;"></asp:TextBox>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    </span>
                </asp:Panel>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlUCSubmit" runat="server">
            <div class="height50" style="min-height: 21px; padding-top: 1px; padding-bottom: 1px;">
                <uc5:UCSubmit ID="UCSubmit1" runat="server" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlUCAttachment" runat="server">
            <div id="dvAttachment" class="height60" style="padding-top: 1px; padding-bottom: 0px;">
                <uc4:UCAttachments ID="UCAttachments1" runat="server" />
            </div>
        </asp:Panel>
        <%--This div is necessary to make scrolling work correctly on the bottom elements.--%>
        <div id="divBottom" style="height: 100px" />
    </form>
</body>
<script type="text/javascript">
    $(document).ready(function SetScroll() {
        // Legacy scroll disabled intentionally
    });

    function CheckScrollPosition(fieldName) {
        if (fieldName != undefined) {
            setScrolltoTop = document.getElementById("setScrolltoTop");
            setScrolltoTop.value = document.documentElement.scrollTop;
            scrollField = document.getElementById("scrollField");
            scrollField.value = fieldName.id;
        }
    }

    function CheckFileType(fieldName) {
        if (fieldName.value != '') {
            myFileExt = fieldName.value.split('.').pop();
            //accept=".tif,.tiff,.png,.jpg,.jpeg,.gif"
            if (myFileExt == 'tif' || myFileExt == 'tiff' || myFileExt == 'png' || myFileExt == 'jpg' || myFileExt == 'jpeg' || myFileExt == 'gif' || myFileExt == 'bmp') {
                //skip valid file
                if (fieldName.files[0].size > 1048576) {
                    alert("File exceeds 1MB in size. Reduce the size of the image and then attach. For assistance please contact your district tech or open an EBITS ticket.");
                    fieldName.value = "";
                }
            }
            else {
                alert("Only image or picture files can be uploaded.  Please select a new file.");
                fieldName.value = "";
            }
        }
    }

    function SetFalsework(myfield) {
        rb = document.getElementById("optFalsework");
        radio = rb.getElementsByTagName("input");
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                chkVal = i + 1;
            }
        }
        rb.style.border = "";
        rb.title = "";
        cat1 = document.getElementById("grpFalseworkCat1");
        cat2 = document.getElementById("grpFalseworkCat2");
        txtcat = document.getElementById("txtFalsework");
        switch (chkVal) {
            case 1:
                cat1.style.display = "inline";
                cat2.style.display = "none";
                txtcat.style.display = "none";
                break;
            case 2:
                cat1.style.display = "none";
                cat2.style.display = "inline";
                txtcat.style.display = "none";
                break;
            case 3:
                cat1.style.display = "inline";
                cat2.style.display = "inline";
                txtcat.style.display = "none";
                break;
            case 4:
                cat1.style.display = "none";
                cat2.style.display = "none";
                txtcat.style.display = "inline";
                break;
        }
    }

    function CheckTextBox(myfield, desc, underlne) {
        isValidate = document.getElementById("isValidate");
        if (!myfield.value && isValidate.value == "True") {
            myfield.style.border = "1px dashed red"
            myfield.title = desc
        }
        else {
            if (underlne == true) {
                myfield.style.borderColor = "";
                myfield.style.borderBottom = "1px solid";
                myfield.style.borderLeft = "none";
                myfield.style.borderRight = "none";
                myfield.style.borderTop = "none";
            }
            else {
                myfield.style.border = "";
                myfield.title = "";
            }
        }
    }

    function CheckEEOOfficer(desc) {
        isValidate = document.getElementById("isValidate");
        myfield = document.getElementById("txtEEOOfficer");
        rb = document.getElementById("optDesignatedEEO");
        radio = rb.getElementsByTagName("input");
        if (myfield.value == "" && radio[0].checked && isValidate.value == "True") {
            myfield.style.border = "1px dashed red"
            myfield.title = desc
        }
        else {
            myfield.style.border = "";
            myfield.title = "";
        }
    }

    function SetStormWater() {
        chkVal = 0;
        rb = document.getElementById("optStormwater");
        radio = rb.getElementsByTagName("input");
        group3 = document.getElementById("group3");
        group4 = document.getElementById("group4");
        group5 = document.getElementById("group5");
        group5_2 = document.getElementById("group5_2");
        chkSpec = document.getElementById("chkSpecification");

        group3.style.display = "inline";
        group4.style.display = "inline";
        group5.style.display = "inline";
        group5_2.style.display = "inline";

        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                chkVal = i + 1;
            }
        }

        if (chkVal != 1) {
            group3.style.display = "none"
        };
        if (chkVal != 2 || chkSpec.value != "2015") {
            group4.style.display = "none"
        };
        if (chkVal != 3 || chkSpec.value == "2007") {
            group5.style.display = "none"
        };
        if (chkVal != 4 || chkSpec.value == "2007") {
            group5_2.style.display = "none"
        };
        rb.style.border = "";
        rb.title = "";
        cmkdot = document.getElementById("txtContWPCMKDOT");
        cmlpa = document.getElementById("txtContWPCMLPA");
        mekdot = document.getElementById("txtMetroEngKDOT");
        melpa = document.getElementById("txtMetroEngLPA");
        opt1 = document.getElementById("optVIIIB1c");
        opt2 = document.getElementById("optVIIIB1d");
        opt3 = document.getElementById("optVIIIB1ea");
        opt4 = document.getElementById("optVIIIB1eb");
        if (chkVal == 3) {
            CheckTextBox(cmkdot, 'Contractors WPCM is required.')
            CheckTextBox(mekdot, 'KDOTs Area/Metro Engineer is required.')
            SetRadioButton(opt1, 'Select whether the Contractors SWPPP has been submitted or not.')
            SetRadioButton(opt2, 'Select whether the Contractors SWPPP has been approved.')
        }
        if (chkVal == 4) {
            CheckTextBox(cmlpa, 'Contractors WPCM is required.')
            CheckTextBox(melpa, 'KDOTs Area/Metro Engineer is required.')
            SetRadioButton(opt3, 'Select whether the Contractors SWPPP has been submitted or not.')
            SetRadioButton(opt4, 'Select whether the Contractors SWPPP has been approved or not.')
        }
    }

    function CheckDBE() {
        isValidate = document.getElementById("isValidate");
        rb = document.getElementById("optDBEParticipation");
        rb1 = document.getElementById("optDBEGoal");
        rb2 = document.getElementById("optDBEChanged");
        rb3 = document.getElementById("optLtrDBEMob");
        rb4 = document.getElementById("optDBETruck");

        radio = rb.getElementsByTagName("input");
        radio1 = rb1.getElementsByTagName("input");
        radio2 = rb2.getElementsByTagName("input");
        radio3 = rb3.getElementsByTagName("input");
        radio4 = rb4.getElementsByTagName("input");

        if (radio[0].checked) {
            if (!radio1[0].checked && !radio1[1].checked && isValidate.value == "True") {
                rb1.style.border = "1px dashed red"
                rb1.title = "Select whether or not this project has a DBE goal."
            }
            else {
                rb1.style.border = "";
                rb1.title = "";
            }
            if (!radio2[0].checked && !radio2[1].checked && isValidate.value == "True") {
                rb2.style.border = "1px dashed red"
                rb2.title = "Select whether or not the DBE's have changed."
            }
            else {
                rb2.style.border = "";
                rb2.title = "";
            }
            if (!radio3[0].checked && !radio3[1].checked && isValidate.value == "True") {
                rb3.style.border = "1px dashed red"
                rb3.title = "Select whether or not the Contractor submitted a letter for DBE mobilization."
            }
            else {
                rb3.style.border = "";
                rb3.title = "";

            }
            if (!radio4[0].checked && !radio4[1].checked && isValidate.value == "True") {
                rb4.style.border = "1px dashed red"
                rb4.title = "Select whether or not DBE Trucking is being used toward the goal.(Labor Compliance - DBE)"
            }
            else {
                rb4.style.border = "";
                rb4.title = "";
            }
        }
    }

    function CheckTBRange(myfield, beginRange, endRange, desc, numdec) {
        isValidate = document.getElementById("isValidate");
        if ((myfield.value < beginRange || myfield.value > endRange) && isValidate.value == "True") {
            myfield.style.border = "1px dashed red"
            myfield.title = desc
        }
        else {
            myfield.style.border = "";
            myfield.title = "";
            myfield.value = parseFloat(myfield.value).toFixed(numdec);
        }
    }

    function SetRadioButton(myfield, desc) {
        isValidate = document.getElementById("isValidate");
        rb = document.getElementById(myfield.id);
        radio = rb.getElementsByTagName("input");
        radVal = false;
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                radVal = true;
            }
        }
        if (radVal == false && isValidate.value == "True") {
            rb.style.border = "1px dashed red";
            rb.title = desc;
        }
        else {
            rb.style.border = "";
            rb.title = "";
        }
    }

    function SetRadioButton1(myfield, desc) {
        isValidate = document.getElementById("isValidate");
        rb = document.getElementById(myfield.id);
        radio = rb.getElementsByTagName("input");
        chkVal = 0
        group7 = document.getElementById("group7");
        txtVIIIC = document.getElementById("txtVIIIC");
        for (var i = 0; i < 3; i++) {
            if (radio[i].checked) {
                chkVal = i;
            }
        }

        if (chkVal != 1) {
            group7.style.display = "none"
            txtVIIIC.style.display = "InLine"
        }
        if (chkVal == 1) {
            group7.style.display = "InLine"
            txtVIIIC.style.display = "InLine"
        };

        radVal = false;
        for (var i = 0; i < 3; i++) {
            if (radio[i].checked) {
                radVal = true;
            }
        }
        if (radVal == false && isValidate.value == "True") {
            rb.style.border = "1px dashed red";
            rb.title = desc;
        }
        else {
            rb.style.border = "";
            rb.title = "";
        }
    }

    function SetRadioButton2(myfield, desc) {
        isValidate = document.getElementById("isValidate");
        rb = document.getElementById(myfield);
        radio = rb.getElementsByTagName("input");
        radVal = false;
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                radVal = true;
            }
        }
        if (radVal == false && isValidate.value == "True") {
            rb.style.border = "1px dashed red";
            rb.title = desc;
        }
        else {
            rb.style.border = "";
            rb.title = "";
        }
    }

    function ChkBoxCondFormat(myfield, condGrp, hideVal) {
        myGrp = document.getElementById(condGrp);
        cb = document.getElementById(myfield);
        if (cb.checked == true) {
            myGrp.style.display = "inline"
        }
        else {
            myGrp.style.display = "none"
        }
        if (myfield == "chkControlDemoCatB") {
            myTextBox = document.getElementById("txtCatBSupervisor");
            isValidate = document.getElementById("isValidate");
            if (myTextBox.value == "" && isValidate.value == "True") {
                myTextBox.style.border = "1px dashed red";
                myTextBox.title = "Enter the Contractor's Demolition Supervisor for Category B.";
                myTextBox.focus();
            }
        }
        if (myfield == "chkControlDemoCatC") {
            myTextBox = document.getElementById("txtCntrlDemoSuper");
            isValidate = document.getElementById("isValidate");
            if (myTextBox.value == "" && isValidate.value == "True") {
                myTextBox.style.border = "1px dashed red";
                myTextBox.title = "Enter the Contractor's Demolition Supervisor for Category C.";
                myTextBox.focus();
            }
        }
    }

    function optBtnCondFormat(myfield, condGrp, hideVal) {
        myGrp = document.getElementById(condGrp);
        myId = myfield.id;
        myHide = hideVal - 1;
        rb = document.getElementById(myId);
        radio = rb.getElementsByTagName("input");
        if (radio[myHide].checked) {
            myGrp.style.display = "none"
        }
        else {
            myGrp.style.display = "inline"
        }
        myfield.style.border = "";
        myfield.title = "";
        if (myId == "optDBEGoal" && radio[0].checked) {
            DBEGoal = document.getElementById("txtDBEGoal");
            DBECommitment = document.getElementById("txtDBECommitment");
            CheckTextBox(DBEGoal, "DBE Goal Percentage is required if DBE is selected");
            CheckTextBox(DBECommitment, "DBE Commitment Percentage is required if DBE is selected");
        }
        if (myId == "optGrading" && radio[0].checked) {
            optPlanQty = document.getElementById("optPlanQty");
            SetRadioButton(optPlanQty, 'Select whether or not the Contractor is accepting plan quantity for Contractor Furnished Excavation.');
        }
        if (myId == "optAsphPaving" && radio[0].checked) {
            optQC = document.getElementById('optQC');
            SetRadioButton(optQC, 'Select whether QC/QA HMA is applicable or not.');
        }
        if (myId == "optQC" && radio[0].checked) {
            optQCSubmitted = document.getElementById('optQCSubmitted');
            optLotID = document.getElementById('optLotID');
            SetRadioButton(optQCSubmitted, 'Contractor QC/QA Submitted for Approval Question Required.');
            SetRadioButton(optLotID, 'You must select which lots the QC/QA HMA applies to.');
        }
        if (myId == "optConcPaving" && radio[0].checked) {
            optConcPavQCSub = document.getElementById('optConcPavQCSub');
            SetRadioButton(optConcPavQCSub, 'Contractor QC/QA Submitted for Approval Question Required.');
        }
        if (myId == "optStructures" && radio[0].checked) {
            optFalsework = document.getElementById('optFalsework');
            SetRadioButton(optFalsework, 'Select the type of falsework on the contract.');
            optContDemoSuper = document.getElementById('optContDemoSuper');
            SetRadioButton(optContDemoSuper, 'Select whether or not there is a controlled demolition Supervisor.');
            optFieldErecSuper = document.getElementById('optFieldErecSuper');
            SetRadioButton(optFieldErecSuper, 'Select whether or not there is a field erection supervisor.');
            optDrilledShafts = document.getElementById('optDrilledShafts');
            SetRadioButton(optDrilledShafts, 'Select whether or not there are drilled shafts.');
        }
    }

    function formatPhone(fieldName) {
        isValidate = document.getElementById("isValidate");
        fieldName.value = fieldName.value.replace("(", "");
        fieldName.value = fieldName.value.replace(")", "");
        fieldName.value = fieldName.value.replace(" ", "");
        fieldName.value = fieldName.value.replace("-", "");
        if (fieldName.value.length != 10 && isValidate.value == "True") {
            fieldName.style.border = '1px dashed red';
            fieldName.title = 'Invalid phone number. Please enter all 10 digits';
        }
        else {
            if (fieldName.id == "txtCntrsRepPhone" || fieldName.id == "txtEmergContactPhone") {
                fieldName.style.borderStyle = 'none';
                fieldName.style.border = 'unset';
                fieldName.style.borderBottom = 'solid 1px';
                fieldName.title = '';
                fieldName.value = fieldName.value.replace(/\D+/g, '')
                    .replace(/(\d{3})(\d{3})(\d{4})/, '($1) $2-$3');
            }
            else {
                fieldName.style.border = 'none';
                fieldName.title = '';
                fieldName.value = fieldName.value.replace(/\D+/g, '')
                    .replace(/(\d{3})(\d{3})(\d{4})/, '($1) $2-$3');
            }
        }
    }

    var idleTime = 0;
    $(document).ready(function () {
        //Increment the idle time counter every minute.
        var idleInterval = setInterval(timerIncrement, 60000); // 1 minute=60000 

        //Zero the idle timer on mouse movement.
        $(this).mousemove(function (e) {
            idleTime = 0;
        });
        $(this).keypress(function (e) {
            idleTime = 0;
        });
    });

    function timerIncrement() {
        idleTime = idleTime + 1;
        if (idleTime > 4) { // 20 minutes > 19  5 min >4
            // window.location.reload();
            __doPostBack('', '');
        }
    };

    // ✅ DO NOT override ScriptManager's __doPostBack
    (function () {
        if (typeof window.__doPostBack === "function") return;

        window.__doPostBack = function (eventTarget, eventArgument) {
            var theForm = document.forms[0];
            if (!theForm) return;

            if (!theForm.onsubmit || (theForm.onsubmit() !== false)) {
                theForm.__EVENTTARGET.value = eventTarget;
                theForm.__EVENTARGUMENT.value = eventArgument;
                theForm.submit();
            }
        };
    })();


    $(document).ready(function () {
        $("#dteMtgDate").datepicker({
            showOn: "button",
            buttonImage: "content/images/calendar.png",
            buttonImageOnly: true,
            buttonText: "Select date"
        });
        if ($('#IsFormLocked').val() == '"true"') {
            $(".ui-datepicker-trigger").hide();
        }
    });
    $(document).ready(function () {
        $("#dteEarlyStart").datepicker({
            showOn: "button",
            buttonImage: "content/images/calendar.png",
            buttonImageOnly: true,
            buttonText: "Select date"
        });
        if ($('#IsFormLocked').val() == '"true"') {
            $(".ui-datepicker-trigger").hide();
        }
    });
    $(document).ready(function () {
        $("#dteLateStart").datepicker({
            showOn: "button",
            buttonImage: "content/images/calendar.png",
            buttonImageOnly: true,
            buttonText: "Select date"
        });
        if ($('#IsFormLocked').val() == '"true"') {
            $(".ui-datepicker-trigger").hide();
        }
    });
    $(document).ready(function () {
        $("#dteTentStart").datepicker({
            showOn: "button",
            buttonImage: "content/images/calendar.png",
            buttonImageOnly: true,
            buttonText: "Select date"
        });
        if ($('#IsFormLocked').val() == '"true"') {
            $(".ui-datepicker-trigger").hide();
        }
    });
    $(function () {
        $('.normal').autosize();
        $('.animated').autosize({ append: "\n" });
    });
    $(function () {
        $(document).keyup(function (e) {
            var key = (e.keyCode ? e.keyCode : e.charCode);
            switch (key) {
                case 119:
                    //alert("F8 has been pressed")
                    document.getElementById('F8Pressed').click();
                    break;
                case 120:
                    //alert("F9 has been pressed")
                    document.getElementById('F9Pressed').click();
                    break;
                default: ;
            }
        });
    });

    (function () {
        'use strict';

        /* ============================================================
           SAFE LOGGER
        ============================================================ */
        function log(msg) {
            if (window.console && console.log) {
                console.log(msg);
            }
        }



        /* ============================================================
           GRID FILTER (ONLY APPLY WHERE NEEDED)
           NOTE: grdSubContractor intentionally excluded
        ============================================================ */
        var GRID_PATTERNS = [
            'grdattendance',
            'grdutility',
            'grdcc'
        ];

        function isGridField(field) {
            var s = ((field.id || '') + ' ' + (field.name || '')).toLowerCase();
            for (var i = 0; i < GRID_PATTERNS.length; i++) {
                if (s.indexOf(GRID_PATTERNS[i]) !== -1) return true;
            }
            return false;
        }

        /* ============================================================
           CLEARABLE FIELDS (INPUT + TEXTAREA)
        ============================================================ */
        function isClearable(field) {
            if (!field || !field.tagName) return false;

            var tag = field.tagName.toLowerCase();
            if (tag === 'input' && field.type === 'text') return true;
            if (tag === 'textarea') return true;

            return false;
        }

        /* ============================================================
           CSS (INLINE, IE SAFE)
        ============================================================ */
        function injectCSS() {
            if (document.getElementById('final-clear-style')) return;

            var css = document.createElement('style');
            css.id = 'final-clear-style';
            css.type = 'text/css';
            css.innerHTML =
                '.final-clear-wrap{' +
                'position:relative !important;' +
                'display:inline-block !important;' +
                'width:100% !important;' +
                '}' +

                '.final-clear-btn{' +
                'position:absolute !important;' +
                'right:6px !important;' +
                'top:50% !important;' +
                'transform:translateY(-50%) !important;' +
                'background:transparent !important;' +
                'border:none !important;' +
                'font-size:11px !important;' +
                'font-weight:bold !important;' +
                'color:#000 !important;' +
                'cursor:pointer !important;' +
                'opacity:0 !important;' +
                'pointer-events:none !important;' +
                'z-index:99999 !important;' +
                'user-select:none !important;' +
                'line-height:1 !important;' +
                '}' +

                '.final-clear-btn.visible{' +
                'opacity:1 !important;' +
                'pointer-events:auto !important;' +
                '}' +

                '.final-clear-btn:hover{' +
                'color:#333 !important;' +
                '}';

            document.head.appendChild(css);
        }

        /* ============================================================
           VISIBILITY LOGIC
        ============================================================ */
        function updateVisibility(field, btn) {
            var hasValue = field.value && field.value.replace(/\s+/g, '') !== '';
            var isFocused = document.activeElement === field;

            if (hasValue && isFocused) {
                btn.classList.add('visible');
            } else {
                btn.classList.remove('visible');
            }
        }

        /* ============================================================
           🔒 GRID ROW STABILIZER
        ============================================================ */
        function stabilizeGridRow(field) {
            try {
                var td = field.closest('td');
                if (!td) return;

                var tr = td.parentElement;
                if (!tr || tr.tagName !== 'TR') return;

                tr.style.display = 'none';
                tr.offsetHeight;
                tr.style.display = '';
            } catch (e) { }
        }

        /* ============================================================
           ATTACH CLEAR BUTTON
        ============================================================ */
        function attach(field) {

            // 🚫 Never attach clear button inside Attendance grid
            if (field.closest && field.closest('#AttendenceSection')) return;

            if (field.classList && field.classList.contains('no-clear')) return;

            if (field.getAttribute('data-clear-attached') === '1') return;
            field.setAttribute('data-clear-attached', '1');



            var wrap = document.createElement('div');
            wrap.className = 'final-clear-wrap';

            var btn = document.createElement('button');
            btn.type = 'button';
            btn.className = 'final-clear-btn';
            btn.innerHTML = '&#10005;';
            btn.setAttribute('data-for', field.id);

            var parent = field.parentNode;
            parent.insertBefore(wrap, field);
            wrap.appendChild(field);
            wrap.appendChild(btn);

            // 🔒 prevent width growth
            field.style.boxSizing = 'border-box';
            field.style.paddingRight = '22px';

            if (field.tagName === 'TEXTAREA' && /phone|email/i.test(field.id + field.name)) {
                field.style.whiteSpace = 'nowrap';


                field.style.borderBottom = '';
            }


            // Preserve original width
            setTimeout(function () {
                var w = field.offsetWidth;
                if (w > 0) wrap.style.width = w + 'px';
            }, 0);

            function sync() {
                updateVisibility(field, btn);
            }

            field.addEventListener('input', sync);
            field.addEventListener('change', sync);
            field.addEventListener('focus', sync);
            field.addEventListener('blur', sync);
            field.addEventListener('keyup', sync);

            setTimeout(sync, 150);
        }

        /* ============================================================
           CLEAR HANDLER (DELEGATED) — FIXED
        ============================================================ */
        document.addEventListener('mousedown', function (e) {
            var t = e.target;
            if (!t || !t.classList || !t.classList.contains('final-clear-btn')) return;

            e.preventDefault();
            e.stopPropagation();

            var id = t.getAttribute('data-for');
            var field = document.getElementById(id);
            if (!field) return;



            field.value = '';
            field.defaultValue = '';
            try { field.setAttribute('value', ''); } catch (x) { }

            // ✅ autosize ONLY for TEXTAREA
            try {
                if (
                    field.tagName === 'TEXTAREA' &&
                    window.jQuery &&
                    jQuery(field).autosize
                ) {
                    jQuery(field).trigger('autosize.destroy');
                    jQuery(field).autosize();
                }
            } catch (ex) { }

            try {
                var ev1 = document.createEvent('HTMLEvents');
                ev1.initEvent('input', true, false);
                field.dispatchEvent(ev1);

                var ev2 = document.createEvent('HTMLEvents');
                ev2.initEvent('change', true, false);
                field.dispatchEvent(ev2);
            } catch (x2) { }

            field.focus();
            updateVisibility(field, t);
            stabilizeGridRow(field);

        }, true);

        /* ============================================================
           INITIALIZE
        ============================================================ */
        function init() {
            injectCSS();

            var fields = document.querySelectorAll('input[type="text"], textarea');
            for (var i = 0; i < fields.length; i++) {
                // 🚫 SKIP Attendance grid completely
                if (fields[i].closest && fields[i].closest('#AttendenceSection')) {
                    continue;
                }
                if (isGridField(fields[i]) && isClearable(fields[i])) {
                    attach(fields[i]);
                }
            }
        }

        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', init);
        } else {
            init();
        }

        /* ============================================================
           UPDATEPANEL SUPPORT
        ============================================================ */
        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager
                .getInstance()
                .add_endRequest(function () {
                    init();
                });
        }

    })();

    // Helper function to update clear button visibility
    function updateClearButtonVisibility(field) {
        var container = field.closest('.clearable');
        if (container) {
            var hasValue = field.value && field.value.trim() !== '';
            if (hasValue) {
                container.classList.add('has-value');
            } else {
                container.classList.remove('has-value');
            }
        }
    }

    // YOUR EXISTING validateEmail function - UPDATED to work with CSS classes
    function validateEmail(email) {
        isValidate = document.getElementById("isValidate");
        var re = email.value.match(/\S+@\S+\.\S+/);

        // Update clear button visibility first
        updateClearButtonVisibility(email);

        if (re == null && isValidate.value == "True") {
            email.style.border = '1px dashed red';
            email.title = 'Invalid email address.';
            email.classList.add('invalid-field');
            email.classList.remove('valid-field');
        }
        else {
            email.style.border = 'none';
            email.title = '';
            email.classList.remove('invalid-field');
            email.classList.add('valid-field');
        }
    }

    function fixAllGridTextareas() {
        var grids = document.querySelectorAll('table[id*="grd"]'); // matches grdAttendance, grdUtility, etc.

        grids.forEach(function (grid) {
            // Select both textareas and input[type=text]
            var elements = grid.querySelectorAll('textarea, input[type="text"]');

            elements.forEach(function (el) {
                // 🚫 Skip clear-button wrapped elements
                if (el.closest(".simple-clear-container")) {
                    return;
                }

                // Force readable styles
                el.style.setProperty('color', 'black', 'important');
                el.style.setProperty('background-color', 'white', 'important');
                el.style.setProperty('-webkit-text-fill-color', 'black', 'important');
                el.style.setProperty('opacity', '1', 'important');

                // WebKit fix
                if ('webkitTextFillColor' in el.style) {
                    el.style.webkitTextFillColor = 'black';
                }

                // Force repaint
                void el.offsetWidth;
            });


        });
    }

    // ✅ Run automatically after DOM and page load
    document.addEventListener('DOMContentLoaded', function () {
        setTimeout(fixAllGridTextareas, 50);
        setTimeout(fixAllGridTextareas, 200);
        setTimeout(fixAllGridTextareas, 500);
    });

    window.addEventListener('load', fixAllGridTextareas);

    // ✅ Run after any UpdatePanel partial postback
    if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            setTimeout(fixAllGridTextareas, 50);
        });
    }

    //TextBoxes clear button
    (function () {
        'use strict';

        function injectCSS() {
            if (document.getElementById('txt-clear-style')) return;

            var css = document.createElement('style');
            css.id = 'txt-clear-style';
            css.textContent =
                '.txt-clear-btn{' +
                'position:absolute;' +
                'right:6px;top:50%;transform:translateY(-50%);' +
                'background:transparent;border:none;' +
                'font-size:11px;font-weight:bold;cursor:pointer;' +
                'opacity:0;pointer-events:none;z-index:99999;' +
                '}' +
                '.txt-clear-btn.visible{' +
                'opacity:1;pointer-events:auto;' +
                '}';
            document.head.appendChild(css);
        }

        function attachTextbox(field) {
            if (field.dataset.txtClear) return;
            if (field.tagName !== 'INPUT' || field.type !== 'text') return;
            if (field.disabled || field.readOnly) return;

            //skip fields that should never get a clear button
            if (field.classList.contains('no-clear')) return;

            var id = field.id.toLowerCase();
            if (
                id.includes('grdattendance') ||
                id.includes('grdutility') ||
                id.includes('grdrep') ||
                id.includes('grdsubcontractor')
            ) return;

            field.dataset.txtClear = '1';

            var btn = document.createElement('button');
            btn.type = 'button';
            btn.className = 'txt-clear-btn';
            btn.innerHTML = '&#10005;';
            btn.dataset.for = field.id;
            btn.tabIndex = -1;

            btn.addEventListener('mousedown', function (e) {
                e.preventDefault();
            });

            // ✅ INLINE wrapper (datepicker-safe)
            var wrapper = document.createElement('span');
            wrapper.style.position = 'relative';
            wrapper.style.display = 'inline-block';

            field.parentNode.insertBefore(wrapper, field);
            wrapper.appendChild(field);
            wrapper.appendChild(btn);

            field.style.boxSizing = 'border-box';
            field.style.paddingRight = '22px'; // space for ❌ only

            function sync() {
                var hasValue = field.value.trim() !== '';
                var focused = document.activeElement === field;
                btn.classList.toggle('visible', hasValue && focused);
            }

            field.addEventListener('input', sync);
            field.addEventListener('change', sync);
            field.addEventListener('focus', sync);
            field.addEventListener('blur', sync);

            sync();
        }

        document.addEventListener('mousedown', function (e) {
            var btn = e.target.closest('.txt-clear-btn');
            if (!btn) return;

            e.preventDefault();
            e.stopPropagation();

            var field = document.getElementById(btn.dataset.for);
            if (!field) return;

            // hard clear ONLY for our date fields
            if (typeof window.clearDateInputHard === 'function' &&
                (field.id === 'dteMtgDate' || field.id === 'dteEarlyStart' || field.id === 'dteLateStart' || field.id === 'dteTentStart')) {

                window.clearDateInputHard(field);

            } else {
                field.value = '';
                field.dispatchEvent(new Event('input', { bubbles: true }));
                field.dispatchEvent(new Event('change', { bubbles: true }));
            }

            field.focus();
        }, true);

        function init() {
            injectCSS();
            document.querySelectorAll('input[type="text"]').forEach(attachTextbox);
        }

        document.readyState === 'loading'
            ? document.addEventListener('DOMContentLoaded', init)
            : init();

        if (window.Sys?.WebForms?.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(init);
        }
    })();

    //GridSubContractor
    (function () {
        'use strict';

        function injectCSS() {
            if (document.getElementById('subc-clear-style')) return;

            var css = document.createElement('style');
            css.id = 'subc-clear-style';
            css.textContent =
                '.subc-clear-btn{' +
                'position:absolute;' +
                'right:6px;top:50%;transform:translateY(-50%);' +
                'background:transparent;border:none;' +
                'font-size:11px;font-weight:bold;cursor:pointer;' +
                'opacity:0;pointer-events:none;z-index:99999;' +
                '}' +
                '.subc-clear-btn.visible{' +
                'opacity:1;pointer-events:auto;' +
                '}';
            document.head.appendChild(css);
        }

        function attachSubContractor(field) {
            if (field.dataset.subcClear) return;
            if (!field.id || !field.id.toLowerCase().includes('grdsubcontractor')) return;

            field.dataset.subcClear = '1';

            var td = field.closest('td');
            if (getComputedStyle(td).position === 'static') {
                td.style.position = 'relative';
            }

            var btn = document.createElement('button');
            btn.type = 'button';
            btn.className = 'subc-clear-btn';
            btn.innerHTML = '&#10005;';
            btn.dataset.for = field.id;
            btn.tabIndex = -1;

            btn.addEventListener('mousedown', e => e.preventDefault());

            td.appendChild(btn);
            field.style.paddingRight = '22px';

            function sync() {
                var hasValue = field.value.trim() !== '';
                var focused = document.activeElement === field;
                btn.classList.toggle('visible', hasValue && focused);
            }

            field.addEventListener('input', sync);
            field.addEventListener('focus', sync);
            field.addEventListener('blur', sync);

            sync();
        }


        document.addEventListener('mousedown', function (e) {
            var btn = e.target.closest('.subc-clear-btn');
            if (!btn) return;

            e.preventDefault();
            var field = document.getElementById(btn.dataset.for);
            field.value = '';
            field.dispatchEvent(new Event('input', { bubbles: true }));
            field.focus();
        }, true);

        function init() {
            injectCSS();
            document.querySelectorAll('input[type="text"], textarea')
                .forEach(attachSubContractor);
        }

        document.readyState === 'loading'
            ? document.addEventListener('DOMContentLoaded', init)
            : init();

        if (window.Sys?.WebForms?.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(init);
        }
    })();


    (function () {
        function normalizeCompactTextareas() {
            var nodes = document.querySelectorAll('textarea.textarea-compact');
            nodes.forEach(function (el) {
                // Force single-line visual
                el.setAttribute('rows', '1');           // prevent UA two-row baseline
                el.style.setProperty('height', '18px', 'important');
                el.style.setProperty('width', '624px', 'important');
                el.style.setProperty('padding-top', '0', 'important');
                el.style.setProperty('padding-bottom', '0', 'important');
                el.style.setProperty('line-height', '16px', 'important');
                el.style.setProperty('overflow', 'clip', 'important');
                el.style.setProperty('resize', 'none', 'important');
                el.style.setProperty('whiteSpace', 'nowrap', 'important');
                el.style.setProperty('border', '1px solid #ccc', 'important');
                el.style.setProperty('min-height', '0', 'important');
                el.style.setProperty('appearance', 'none', 'important');
                el.style.setProperty('-webkit-appearance', 'none', 'important');
                el.style.setProperty('-moz-appearance', 'none', 'important');
            });
        }

        // Run on DOM ready and again after any partial postback (WebForms)
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', normalizeCompactTextareas);
        } else {
            normalizeCompactTextareas();
        }

        // ASP.NET UpdatePanel support: hook MS AJAX if present
        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(normalizeCompactTextareas);
        }
    })();

    function triggerFileUpload() {
        var fileInput = document.getElementById('<%= uplPicture.ClientID %>');
        if (fileInput) {
            fileInput.click();
        }
    }


    (function () {
        function lockGridTextareas() {
            // target any GridView tables you use (compact-grid / ie-grid / any *grid*)
            var sel = 'table.compact-grid textarea, table.ie-grid textarea, table[class*="grid"] textarea';

            document.querySelectorAll(sel).forEach(function (ta) {

                // ✅ DO NOT lock growable cells
                if (ta.classList && ta.classList.contains('allow-grow')) return;

                // remove autosize inline sizing
                ta.style.removeProperty('height');
                ta.style.removeProperty('min-height');
                ta.style.removeProperty('max-height');

                // force compact IE-like height (use setProperty to apply !important)
                ta.style.setProperty('height', '30px', 'important');
                ta.style.setProperty('min-height', '30px', 'important');
                ta.style.setProperty('max-height', '30px', 'important');
                ta.style.setProperty('line-height', '30px', 'important');
                ta.style.setProperty('overflow', 'hidden', 'important');
                ta.style.setProperty('resize', 'none', 'important');
                ta.style.setProperty('display', 'block', 'important');
                ta.style.setProperty('box-sizing', 'border-box', 'important');
                ta.style.setProperty('margin', '0', 'important');
                ta.style.setProperty('padding', '0 2px', 'important');
            });
        }

        // Run after load + after any partial postback (UpdatePanel)
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', lockGridTextareas);
        } else {
            lockGridTextareas();
        }

        // If your page uses ASP.NET UpdatePanel, this ensures it re-applies after async postbacks
        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(lockGridTextareas);
        }
    })();

    //header wrapper
    (function () {
        function normalize(s) {
            return (s || '')
                .replace(/\u00a0/g, ' ')
                .replace(/\s+/g, ' ')
                .trim()
                .toLowerCase();
        }

        function forceHeaderBreaks() {
            document.querySelectorAll('table.compact-grid').forEach(function (tbl) {
                tbl.querySelectorAll('tr th, tr td').forEach(function (cell) {
                    var text = normalize(cell.textContent);

                    if (text === 'business telephone') {
                        cell.innerHTML = 'Business<br>Telephone';
                    }
                    else if (text === 'cell telephone') {
                        cell.innerHTML = 'Cell<br>Telephone';
                    }
                    else if (text === 'company or organization') {
                        cell.innerHTML = 'Company or<br>Organization';
                    }
                });
            });
        }

        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', forceHeaderBreaks);
        } else {
            forceHeaderBreaks();
        }

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance()
                .add_endRequest(forceHeaderBreaks);
        }
    })();

    //compact table grid
    (function () {
        function lockCompactTableTextareas() {
            document.querySelectorAll('table.ie-compact-table textarea').forEach(function (ta) {
                if (ta.classList && ta.classList.contains('allow-grow')) return;
                ta.style.removeProperty('height');
                ta.style.removeProperty('min-height');
                ta.style.removeProperty('max-height');

                ta.style.setProperty('height', '30px', 'important');
                ta.style.setProperty('min-height', '30px', 'important');
                ta.style.setProperty('max-height', '30px', 'important');
                ta.style.setProperty('line-height', '30px', 'important');
                ta.style.setProperty('overflow', 'hidden', 'important');
                ta.style.setProperty('resize', 'none', 'important');
                ta.style.setProperty('display', 'block', 'important');
                ta.style.setProperty('box-sizing', 'border-box', 'important');
                ta.style.setProperty('margin', '0', 'important');
                ta.style.setProperty('padding', '0 2px', 'important');
            });
        }

        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', lockCompactTableTextareas);
        } else {
            lockCompactTableTextareas();
        }

        // UpdatePanel support (if applicable on this page)
        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(lockCompactTableTextareas);
        }
    })();

    //single compact text area 
    (function () {
        function lockSingleLineTextareas() {
            document.querySelectorAll('textarea.single-line-textarea').forEach(function (ta) {
                ta.style.removeProperty('height');
                ta.style.removeProperty('min-height');
                ta.style.removeProperty('max-height');

                ta.style.setProperty('height', '18px', 'important');
                ta.style.setProperty('min-height', '18px', 'important');
                ta.style.setProperty('max-height', '18px', 'important');
                ta.style.setProperty('line-height', '18px', 'important');
                ta.style.setProperty('overflow', 'hidden', 'important');
                ta.style.setProperty('resize', 'none', 'important');
                ta.style.setProperty('white-space', 'nowrap', 'important');
                ta.style.setProperty('box-sizing', 'border-box', 'important');
                ta.style.setProperty('padding', '0 4px', 'important');
                ta.style.setProperty('margin', '0', 'important');
            });
        }

        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', lockSingleLineTextareas);
        } else {
            lockSingleLineTextareas();
        }

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(lockSingleLineTextareas);
        }
    })();

    // single line text area growable  (FIXED)
    (function () {
        function autosizeOne(ta) {
            if (!ta) return;

            // Make sure growth is allowed (no max-height clamp from other rules)
            ta.style.removeProperty('max-height');
            ta.style.removeProperty('min-height');

            // Force overflow hidden so scrollHeight reflects full content cleanly
            ta.style.setProperty('overflow', 'hidden', 'important');
            ta.style.setProperty('resize', 'none', 'important');

            // Reset then measure
            ta.style.setProperty('height', 'auto', 'important');

            var min = 20; // single-line look
            var h = Math.max(min, ta.scrollHeight);

            // Apply with !important so nothing snaps it back
            ta.style.setProperty('height', h + 'px', 'important');
            ta.style.setProperty('min-height', min + 'px', 'important');
        }

        function wireGrowTextareas(root) {
            var scope = root || document;

            // IMPORTANT: don't rely on __growWired only; re-run autosize every time.
            scope.querySelectorAll('textarea.grow-textarea').forEach(function (ta) {
                // wire events once
                if (!ta.__growWired) {
                    ta.__growWired = true;
                    ta.addEventListener('input', function () { autosizeOne(ta); });
                    ta.addEventListener('keyup', function () { autosizeOne(ta); });  // extra safety
                    ta.addEventListener('focus', function () { autosizeOne(ta); });
                }

                // always autosize on each pass (page load + endRequest)
                autosizeOne(ta);
            });
        }

        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', function () { wireGrowTextareas(document); });
        } else {
            wireGrowTextareas(document);
        }

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                wireGrowTextareas(document);
            });
        }
    })();

    //growable large textboxes
    (function () {
        function relaxRowForProjMat() {
            var el = document.querySelector('textarea[id$="txtProjMatAdditional"]');
            if (!el) return;

            // Grow textarea itself (force against CSS !important caps)
            el.style.setProperty('max-height', 'none', 'important');
            el.style.setProperty('overflow-y', 'hidden', 'important');
            el.style.setProperty('resize', 'none', 'important');

            el.style.setProperty('height', 'auto', 'important');
            var h = Math.max(48, el.scrollHeight + 2);
            el.style.setProperty('height', h + 'px', 'important');

            // Relax containers that are fixed
            var div = el.parentElement;
            if (div && div.tagName === 'DIV') {
                div.style.setProperty('height', 'auto', 'important');
                div.style.setProperty('overflow', 'visible', 'important');
            }

            var td = el.closest ? el.closest('td') : null;
            if (td) {
                td.style.setProperty('height', 'auto', 'important');
                td.style.setProperty('overflow', 'visible', 'important');
                td.style.setProperty('vertical-align', 'top', 'important');
            }

            var tr = td && td.parentElement && td.parentElement.tagName === 'TR' ? td.parentElement : null;
            if (tr) {
                tr.style.setProperty('height', 'auto', 'important');
                tr.style.setProperty('overflow', 'visible', 'important');
            }
        }


        // Run on input too (keeps row height in sync as it grows)
        document.addEventListener('input', function (e) {
            var t = e.target;
            if (t && t.tagName === 'TEXTAREA' && /txtProjMatAdditional$/.test(t.id || '')) {
                relaxRowForProjMat();
                setTimeout(relaxRowForProjMat, 0);
                setTimeout(relaxRowForProjMat, 30);
            }
        }, true);

        // Initial + UpdatePanel
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', relaxRowForProjMat);
        } else {
            relaxRowForProjMat();
        }

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(relaxRowForProjMat);
        }
    })();

    (function () {
        function target() {
            return document.querySelector('textarea[id$="txtProjMatAdditional"]');
        }

        function markContainers() {
            var el = target();
            if (!el) return;

            var td = el.closest ? el.closest('td') : null;
            var tr = td && td.parentElement && td.parentElement.tagName === 'TR' ? td.parentElement : null;

            if (td) td.className += (td.className.indexOf('grow-td') === -1 ? ' grow-td' : '');
            if (tr) tr.className += (tr.className.indexOf('grow-tr') === -1 ? ' grow-tr' : '');
        }

        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', markContainers);
        } else {
            markContainers();
        }

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(markContainers);
        }
    })();

    //growable script txtCorrespond
    (function () {
        var MIN_H = 43;

        function find() {
            return document.querySelector('textarea[id$="txtCorrespond"]');
        }

        function hasText(el) {
            return !!(el && el.value && el.value.replace(/\s+/g, '').length > 0);
        }

        function normalizeTextStyle(el) {
            // FORCE tight text rendering (beats any global textarea/table rules)
            el.style.setProperty('font-family', 'Verdana, Arial, sans-serif', 'important');
            el.style.setProperty('font-size', '9pt', 'important');
            el.style.setProperty('line-height', '13px', 'important');   // <-- this is the key
            el.style.setProperty('padding', '0 2px', 'important');      // no vertical padding
            el.style.setProperty('margin', '0', 'important');
            el.style.setProperty('box-sizing', 'border-box', 'important');
        }

        function enforceBase(el) {
            if (!el) return;
            normalizeTextStyle(el);

            el.style.setProperty('min-height', MIN_H + 'px', 'important');
            el.style.setProperty('max-height', 'none', 'important');
            el.style.setProperty('overflow-y', 'hidden', 'important');
            el.style.setProperty('resize', 'none', 'important');
        }

        function setFixed(el) {
            enforceBase(el);
            el.style.setProperty('height', MIN_H + 'px', 'important');
        }

        function grow(el, force) {
            if (!el) return;

            enforceBase(el);

            // If empty and not forced, keep exact initial height
            if (!force && !hasText(el)) {
                setFixed(el);
                return;
            }

            // Grow to content
            el.style.setProperty('height', 'auto', 'important');
            var h = el.scrollHeight + 2;
            if (h < MIN_H) h = MIN_H;
            el.style.setProperty('height', h + 'px', 'important');

            // Prevent parent clipping (table layouts)
            var td = el.closest ? el.closest('td') : null;
            if (td) {
                td.style.setProperty('height', 'auto', 'important');
                td.style.setProperty('overflow', 'visible', 'important');
                td.style.setProperty('vertical-align', 'top', 'important');
            }
            var tr = td && td.parentElement && td.parentElement.tagName === 'TR' ? td.parentElement : null;
            if (tr) {
                tr.style.setProperty('height', 'auto', 'important');
                tr.style.setProperty('overflow', 'visible', 'important');
            }
        }

        function applyInitial() {
            var el = find();
            if (!el) return;
            // On load: stay 43px if empty; grow if prefilled
            grow(el, false);
            setTimeout(function () { grow(el, false); }, 0);
            setTimeout(function () { grow(el, false); }, 50);
        }

        // Event delegation (UpdatePanel safe)
        document.addEventListener('input', function (e) {
            var t = e.target;
            if (t && t.tagName === 'TEXTAREA' && /txtCorrespond$/.test(t.id || '')) {
                grow(t, true);
                setTimeout(function () { grow(t, true); }, 0);
                setTimeout(function () { grow(t, true); }, 30);
                setTimeout(function () { grow(t, true); }, 80);
            }
        }, true);

        // Initial + UpdatePanel
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', applyInitial);
        } else {
            applyInitial();
        }

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(applyInitial);
        }
    })();

    //growable for txtLocation
    (function () {
        var MIN_H = 22;   // starting height (adjust if needed)

        function find() {
            return document.querySelector('textarea[id$="txtLocation"]');
        }

        function hasText(el) {
            return !!(el && el.value && el.value.replace(/\s+/g, '').length > 0);
        }

        function normalizeText(el) {
            // Force compact IE-style text (beats any global rules)
            el.style.setProperty('font-family', 'Verdana, Arial, sans-serif', 'important');
            el.style.setProperty('font-size', '9pt', 'important');
            el.style.setProperty('line-height', '13px', 'important');  // <-- tight lines
            el.style.setProperty('padding', '0 2px', 'important');
            el.style.setProperty('margin', '0', 'important');
            el.style.setProperty('box-sizing', 'border-box', 'important');
        }

        function enforceBase(el) {
            normalizeText(el);
            el.style.setProperty('min-height', MIN_H + 'px', 'important');
            el.style.setProperty('max-height', 'none', 'important');
            el.style.setProperty('overflow-y', 'hidden', 'important');
            el.style.setProperty('resize', 'none', 'important');
        }

        function grow(el, force) {
            if (!el) return;

            enforceBase(el);

            // If empty and not forced → keep base height
            if (!force && !hasText(el)) {
                el.style.setProperty('height', MIN_H + 'px', 'important');
                return;
            }

            // Grow to content
            el.style.setProperty('height', 'auto', 'important');
            var h = el.scrollHeight + 2;
            if (h < MIN_H) h = MIN_H;
            el.style.setProperty('height', h + 'px', 'important');

            // Prevent parent clipping (table layouts)
            var td = el.closest ? el.closest('td') : null;
            if (td) {
                td.style.setProperty('height', 'auto', 'important');
                td.style.setProperty('overflow', 'visible', 'important');
                td.style.setProperty('vertical-align', 'top', 'important');
            }
            var tr = td && td.parentElement && td.parentElement.tagName === 'TR' ? td.parentElement : null;
            if (tr) {
                tr.style.setProperty('height', 'auto', 'important');
                tr.style.setProperty('overflow', 'visible', 'important');
            }
        }

        function applyInitial() {
            var el = find();
            if (!el) return;
            grow(el, false);
            setTimeout(function () { grow(el, false); }, 0);
            setTimeout(function () { grow(el, false); }, 50);
        }

        // Event delegation (UpdatePanel safe)
        document.addEventListener('input', function (e) {
            var t = e.target;
            if (t && t.tagName === 'TEXTAREA' && /txtLocation$/.test(t.id || '')) {
                grow(t, true);
                setTimeout(function () { grow(t, true); }, 0);
                setTimeout(function () { grow(t, true); }, 30);
                setTimeout(function () { grow(t, true); }, 80);
            }
        }, true);

        document.addEventListener('change', function (e) {
            var t = e.target;
            if (t && t.tagName === 'TEXTAREA' && /txtLocation$/.test(t.id || '')) {
                grow(t, true);
            }
        }, true);

        // Initial + UpdatePanel
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', applyInitial);
        } else {
            applyInitial();
        }

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(applyInitial);
        }
    })();

    //required field script 

    (function () {
        function hasValue(el) {
            return (el.value || '').replace(/\u00A0/g, ' ').trim().length > 0;
        }

        function updateOne(el) {
            if (!el) return;
            if (hasValue(el)) el.classList.remove('ie-required');
            else el.classList.add('ie-required');
        }

        function wireAll() {
            document.querySelectorAll('input.req, textarea.req, select.req').forEach(function (el) {
                updateOne(el);

                if (!el.__reqWired) {
                    el.__reqWired = true;
                    el.addEventListener('input', function () { updateOne(el); });
                    el.addEventListener('change', function () { updateOne(el); });
                    el.addEventListener('blur', function () { updateOne(el); });
                }
            });
        }

        // Initial load
        if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', wireAll);
        else wireAll();

        // WebForms lifecycle (fires after AutoPostBack / UpdatePanel render)
        if (window.Sys && Sys.Application && Sys.Application.add_load) {
            Sys.Application.add_load(wireAll);
        }
        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(wireAll);
        }
    })();


    // ===============================
    // ✅ Anti-jump scroll stabilizer (keeps WebForms default restore)
    // ===============================
    (function () {
        var KEY = '__LAST_SCROLL_Y__';

        function getY() {
            return window.pageYOffset ||
                document.documentElement.scrollTop ||
                document.body.scrollTop || 0;
        }

        function setY(y) {
            if (typeof y !== 'number' || isNaN(y)) return;
            window.scrollTo(0, y);
        }

        // Save right before navigation/postback starts
        window.addEventListener('beforeunload', function () {
            try { sessionStorage.setItem(KEY, String(getY())); } catch (e) { }
        });

        // After load, re-apply once layout settles to avoid the "jump"
        window.addEventListener('load', function () {
            var y = null;
            try { y = sessionStorage.getItem(KEY); } catch (e) { }
            if (y == null) return;

            var n = parseInt(y, 10);
            if (isNaN(n)) return;

            // Let WebForms restore first, then stabilize
            setTimeout(function () { setY(n); }, 0);
            setTimeout(function () { setY(n); }, 50);
            setTimeout(function () { setY(n); }, 150);
        });

        // If UpdatePanel is used, stabilize after async postback render too
        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(function () {
                try { sessionStorage.setItem(KEY, String(getY())); } catch (e) { }
            });
            prm.add_endRequest(function () {
                var y = null;
                try { y = sessionStorage.getItem(KEY); } catch (e) { }
                if (y == null) return;

                var n = parseInt(y, 10);
                if (isNaN(n)) return;

                setTimeout(function () { setY(n); }, 0);
                setTimeout(function () { setY(n); }, 50);
                setTimeout(function () { setY(n); }, 150);
            });
        }
    })();


    (function () {
        'use strict';

        function isReq(el) { return el && el.classList && el.classList.contains('req'); }
        function isEmpty(el) { return ((el.value || '').trim().length === 0); }

        function applyBorder(el) {
            if (!el || !el.classList) return;

            if (isReq(el) && isEmpty(el)) {
                el.classList.add('kdot-empty');
                el.style.setProperty('border', '1px dashed red', 'important');
                el.style.removeProperty('outline');
            } else if (isReq(el)) {
                el.classList.remove('kdot-empty');
                el.style.setProperty('border', 'none', 'important');
                el.style.setProperty('border-bottom', '1px solid #000', 'important');
                el.style.removeProperty('outline');
            }
        }

        // On first click/focus (BEFORE typing)
        document.addEventListener('focusin', function (e) {
            applyBorder(e.target);
        });

        // Keep updated
        document.addEventListener('input', function (e) {
            applyBorder(e.target);
        });
        document.addEventListener('change', function (e) {
            applyBorder(e.target);
        });

        // Initialize on load
        function refreshAll() {
            document.querySelectorAll('input.req, textarea.req, select.req').forEach(applyBorder);
        }
        document.addEventListener('DOMContentLoaded', refreshAll);
        window.addEventListener('load', refreshAll);

        // UpdatePanel
        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(refreshAll);
        }
    })();


    (function () {
        'use strict';

        function isEmpty(el) {
            return ((el.value || '').replace(/\u00A0/g, ' ').trim().length === 0);
        }

        function syncOne(el) {
            if (!el || !el.classList || !el.classList.contains('req')) return;
            if (isEmpty(el)) el.classList.add('kdot-empty');
            else el.classList.remove('kdot-empty');
        }

        function stampAll() {
            document.querySelectorAll('input.req, textarea.req, select.req').forEach(syncOne);
        }

        // Initial
        if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', stampAll);
        else stampAll();

        window.addEventListener('load', stampAll);

        // Keep in sync on input/change
        document.addEventListener('input', function (e) { syncOne(e.target); }, true);
        document.addEventListener('change', function (e) { syncOne(e.target); }, true);

        // WebForms UpdatePanel support
        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(stampAll);
        }
    })();


    (function () {
        // utility: detect user-initiated interactions (Tab/click)
        var userInteracted = false;
        window.addEventListener('keydown', function (e) {
            if (e.key === 'Tab') userInteracted = true;
        }, true);
        window.addEventListener('mousedown', function () { userInteracted = true; }, true);
        window.addEventListener('pointerdown', function () { userInteracted = true; }, true);

        function installStartupFocusGuard(targetId, guardMs) {
            var start = performance.now();
            var el = document.getElementById(targetId);
            if (!el) return;

            function guard() {
                // If the element is active but the focus is not user-initiated, blur it.
                if ((performance.now() - start) < guardMs &&
                    document.activeElement === el && !userInteracted) {
                    el.blur();
                } else {
                    // past the guard window or user interacted -> stop guarding
                    document.removeEventListener('focusin', guard, true);
                }
            }

            // Run once now and listen during the guard window
            guard();
            document.addEventListener('focusin', guard, true);
            setTimeout(function () {
                document.removeEventListener('focusin', guard, true);
            }, guardMs);
        }

        // Full page load
        window.addEventListener('load', function () {
            installStartupFocusGuard('grdCC_ctl02_txtAdditionalCC', 500);
        });

        // ASP.NET AJAX partial loads (UpdatePanel)
        if (window.Sys && Sys.Application) {
            Sys.Application.add_load(function () {
                // new content just landed, re-guard for a short window
                installStartupFocusGuard('grdCC_ctl02_txtAdditionalCC', 500);
            });
        }
    })();


    (function () {
        function clearMouseFocused() {
            document.querySelectorAll('.mouse-focused').forEach(function (el) {
                el.classList.remove('mouse-focused');
            });
        }

        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', clearMouseFocused);
        } else {
            clearMouseFocused();
        }
    })();

    document.addEventListener('DOMContentLoaded', function () {
        var btnDelete = document.getElementById('<%= btnDelete.ClientID %>');
        var btnBrowse = document.getElementById('<%= btnBrowse.ClientID %>');

        if (btnDelete && btnBrowse && btnDelete.offsetParent !== null) {
            btnBrowse.style.display = 'none';
        }
    });

    //fix for the tabbing issue on clear button
    (function () {
        function removeClearButtonsFromTabOrder() {
            document.querySelectorAll('button.final-clear-btn').forEach(function (btn) {
                btn.tabIndex = -1; // key: skip in Tab order
                btn.setAttribute('aria-hidden', 'true'); // optional
            });
        }

        // initial page load
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', removeClearButtonsFromTabOrder);
        } else {
            removeClearButtonsFromTabOrder();
        }

        // WebForms UpdatePanel support
        if (window.Sys && Sys.Application && Sys.Application.add_load) {
            Sys.Application.add_load(removeClearButtonsFromTabOrder);
        }
    })();

    //Related to instance ID
    (function () {
        // persist per-tab id in window.name (survives navigation in same tab)
        if (!window.name) window.name = "tab-" + Math.random().toString(36).slice(2) + Date.now();

        // push it into the hidden field so server gets same id every postback
        var hf = document.getElementById("<%= hfFormInstance.ClientID %>");
        if (hf) hf.value = window.name;
    })();



    //grid text box growable
    (function () {
        function autosizeTA(ta) {
            if (!ta) return;

            ta.wrap = 'soft';
            ta.style.setProperty('overflow', 'hidden', 'important');
            ta.style.setProperty('max-height', 'none', 'important');
            ta.style.setProperty('line-height', '18px', 'important');
            ta.style.setProperty('min-height', '18px', 'important');

            // stable resize
            ta.style.setProperty('height', '0px', 'important');
            ta.style.setProperty('height', Math.max(18, ta.scrollHeight) + 'px', 'important');
        }

        function wire() {
            document.querySelectorAll('textarea.allow-grow').forEach(function (ta) {
                autosizeTA(ta);

                if (!ta.dataset.autoSizeBound) {
                    ta.addEventListener('input', function () { autosizeTA(ta); });
                    ta.addEventListener('focus', function () { autosizeTA(ta); });
                    ta.dataset.autoSizeBound = '1';
                }
            });
        }

        document.addEventListener('DOMContentLoaded', function () {
            wire();
            setTimeout(wire, 0);
            setTimeout(wire, 50);
        });

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                wire();
                setTimeout(wire, 0);
                setTimeout(wire, 50);
            });
        }
    })();

    //script for grow when start typing for a text box
    (function () {
        var BASELINE_PX = 20;          // 1 line when empty
        var MIN_LINES_WHEN_TYPING = 2; // as soon as user types -> 2 lines minimum
        var BUFFER_LINES = 1;          // IE-like: keep 1 extra blank line visible while typing

        function num(v) { v = parseFloat(v); return isFinite(v) ? v : 0; }
        function linePx(cs) {
            var lh = parseFloat(cs.lineHeight);
            if (!isFinite(lh)) lh = parseFloat(cs.fontSize) * 1.2;
            return lh;
        }

        function getMirror() {
            var m = document.getElementById('__kdotAutosizeMirror');
            if (m) return m;

            m = document.createElement('div');
            m.id = '__kdotAutosizeMirror';
            m.style.position = 'absolute';
            m.style.top = '-99999px';
            m.style.left = '-99999px';
            m.style.visibility = 'hidden';
            m.style.whiteSpace = 'pre-wrap';
            m.style.wordWrap = 'break-word';
            m.style.overflowWrap = 'anywhere';
            m.style.margin = '0';
            document.body.appendChild(m);
            return m;
        }

        function applyHeight(ta, h) {
            ta.style.setProperty('height', h + 'px', 'important');
            ta.style.setProperty('min-height', BASELINE_PX + 'px', 'important'); // baseline floor
            ta.style.setProperty('max-height', 'none', 'important');
            ta.style.setProperty('overflow', 'hidden', 'important');
            ta.style.setProperty('resize', 'none', 'important');
            ta.style.setProperty('box-sizing', 'border-box', 'important');
        }

        function autosize(ta) {
            if (!ta) return;
            ta.wrap = 'soft';

            var cs = window.getComputedStyle(ta);
            var line = linePx(cs);
            var extra = num(cs.paddingTop) + num(cs.paddingBottom) + num(cs.borderTopWidth) + num(cs.borderBottomWidth);

            var m = getMirror();
            m.style.width = ta.clientWidth + 'px';
            m.style.fontFamily = cs.fontFamily;
            m.style.fontSize = cs.fontSize;
            m.style.fontWeight = cs.fontWeight;
            m.style.letterSpacing = cs.letterSpacing;
            m.style.lineHeight = cs.lineHeight;
            m.style.padding = cs.padding;
            m.style.border = cs.border;
            m.style.boxSizing = cs.boxSizing;

            var val = ta.value || '';
            m.textContent = val + '\n';

            // Lines the CONTENT actually needs right now (shrinks when deleting)
            var contentLines = Math.max(1, Math.ceil((m.scrollHeight - extra) / line));

            // Desired behavior:
            // empty => 1 line
            // any text => at least 2 lines
            // keep 1 extra line visible while typing (line2 shows line3, etc.)
            var displayLines;
            if (val.length === 0) {
                displayLines = 1;
            } else {
                displayLines = Math.max(MIN_LINES_WHEN_TYPING, contentLines + BUFFER_LINES);
            }

            // Snap to full-line steps
            var h = Math.ceil((displayLines * line) + extra);
            h = Math.max(BASELINE_PX, h);

            applyHeight(ta, h);
        }

        function bind(ta) {
            if (ta.dataset.autoBound) return;

            function run() { requestAnimationFrame(function () { autosize(ta); }); }

            ta.addEventListener('input', run);
            ta.addEventListener('keyup', run);
            ta.addEventListener('focus', run);
            ta.addEventListener('paste', function () { setTimeout(function () { autosize(ta); }, 0); });

            ta.dataset.autoBound = '1';
            run();
        }

        function wire(root) {
            (root || document)
                .querySelectorAll('textarea.grow-textarea.grow-singleline')
                .forEach(bind);
        }

        document.addEventListener('DOMContentLoaded', function () { wire(document); });

        // WebForms UpdatePanel support
        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                wire(document);
            });
        }
    })();

    // ✅ One script to fix tabbing for multiple fields (KDOT + LPA, etc.)
    (function () {

        const FIX_DURATION_MS = 2500; // how long we fight back
        const FIX_INTERVAL_MS = 100;  // how often

        // Add all fields you want to force-tab here:
        // id: "tabindex you want"
        const TAB_FIX = {
            "txtContWPCMKDOT": "134",
            "txtMetroEngKDOT": "135",

            "txtContWPCMLPA": "136",
            "txtMetroEngLPA": "137"
        };

        function applyOne(id, tabIndex) {
            const el = document.getElementById(id);
            if (!el) return;

            // must be focusable
            el.setAttribute("tabindex", String(tabIndex));
            el.removeAttribute("aria-hidden");

            // if it was truly disabled, it can't receive focus
            // (prefer readonly for "locked" fields but still tabbable)
            if (el.disabled) el.disabled = false;

            // uncomment if you want it non-editable but tabbable
            // el.readOnly = true;
        }

        function fixTabbingOnce() {
            Object.keys(TAB_FIX).forEach(id => applyOne(id, TAB_FIX[id]));
        }

        function fightBack() {
            fixTabbingOnce();

            const start = Date.now();
            const timer = setInterval(() => {
                fixTabbingOnce();
                if (Date.now() - start > FIX_DURATION_MS) clearInterval(timer);
            }, FIX_INTERVAL_MS);
        }

        // ✅ Initial page load
        window.addEventListener("load", fightBack);

        // ✅ UpdatePanel async postbacks
        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(fightBack);
        }

    })();


    (function () {
        function fixDteMtgDateDupes() {
            var field = document.getElementById('dteMtgDate');
            if (!field) return;

            var wrap = field.closest('span');
            if (!wrap) return;

            // 1) Ensure ONE calendar icon inside wrapper
            var insideTrig = wrap.querySelector('img.ui-datepicker-trigger');
            if (!insideTrig) {
                // if trigger exists right after wrapper, move it in
                var maybeOutsideTrig = wrap.nextElementSibling;
                if (maybeOutsideTrig && maybeOutsideTrig.matches && maybeOutsideTrig.matches('img.ui-datepicker-trigger')) {
                    wrap.insertBefore(maybeOutsideTrig, wrap.querySelector('.txt-clear-btn') || null);
                    insideTrig = maybeOutsideTrig;
                }
            }

            // 2) Remove any OUTSIDE duplicate calendar triggers for this field
            // (anything after the wrapper that is a trigger)
            var sib = wrap.nextElementSibling;
            while (sib && sib.matches && sib.matches('img.ui-datepicker-trigger')) {
                var next = sib.nextElementSibling;
                sib.parentNode.removeChild(sib);
                sib = next;
            }

            // 3) Remove any OUTSIDE duplicate clear buttons for this field
            var btnSib = wrap.nextElementSibling;
            while (btnSib && btnSib.matches && btnSib.matches('button.txt-clear-btn[data-for="dteMtgDate"]')) {
                var nextBtn = btnSib.nextElementSibling;
                btnSib.parentNode.removeChild(btnSib);
                btnSib = nextBtn;
            }

            // 4) Make spacing correct (room for calendar + X)
            field.style.boxSizing = 'border-box';
            field.style.paddingRight = '44px';

            var xBtn = wrap.querySelector('button.txt-clear-btn[data-for="dteMtgDate"]');
            if (xBtn) xBtn.style.right = '24px';

            if (insideTrig) {
                insideTrig.style.position = 'absolute';
                insideTrig.style.right = '4px';
                insideTrig.style.top = '50%';
                insideTrig.style.transform = 'translateY(-50%)';
                insideTrig.style.cursor = 'pointer';
                insideTrig.style.zIndex = '99998';
            }
        }

        // run now + after UpdatePanel postbacks
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', fixDteMtgDateDupes);
        } else {
            fixDteMtgDateDupes();
        }

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(fixDteMtgDateDupes);
        }
    })();

    //date picker fix
    // ======================================================================
    // ✅ COMPLETE DROP-IN FIX: Datepicker + X-Clear + SAME-DATE selection (WebForms)
    // ----------------------------------------------------------------------
    // Fixes ALL of this:
    // 1) Click ❌ clears value but does NOT permanently “kill” border
    // 2) After clearing, picking the SAME date (e.g., 2/17/25) writes again
    // 3) Works even when DatePicker is bound to dte* but AutoPostBack textbox is txt*
    // 4) Avoids double-postbacks (fires change only on the element that has __doPostBack)
    // 5) Survives UpdatePanel / endRequest
    //
    // ✅ Paste this ONCE near the bottom of the page (after jQuery UI is loaded).
    // ======================================================================
    (function () {
        if (!window.jQuery || !jQuery.datepicker) return;

        var $ = jQuery;
        var dp = $.datepicker;

        // ---- Put ALL your date textbox ids here (both dte* and txt* if they exist)
        // If you only have dte*, keep only dte*. If you only have txt*, keep only txt*.
        var DATE_IDS = [
            'dteMtgDate', 'dteEarlyStart', 'dteLateStart', 'dteTentStart',
            'txtMtgDate', 'txtEarlyStart', 'txtLateStart', 'txtTentStart'
        ];

        function isTarget(el) {
            return !!el && !!el.id && DATE_IDS.indexOf(el.id) !== -1;
        }

        // txtEarlyStart <-> dteEarlyStart pairing
        function findPeer(el) {
            if (!el || !el.id) return null;
            var id = el.id;

            if (/^txt/i.test(id)) {
                return document.getElementById('dte' + id.substring(3)) || null;
            }
            if (/^dte/i.test(id)) {
                return document.getElementById('txt' + id.substring(3)) || null;
            }
            return null;
        }

        function hasPostbackOnChange(el) {
            if (!el || !el.getAttribute) return false;
            var oc = el.getAttribute('onchange') || '';
            return oc.indexOf('__doPostBack') !== -1;
        }

        // We only fire change on the element that actually triggers WebForms postback
        function getPostbackElement(primary) {
            var peer = findPeer(primary);
            if (hasPostbackOnChange(primary)) return primary;
            if (peer && hasPostbackOnChange(peer)) return peer;
            return primary;
        }

        function ensureBorderNotZero(el) {
            if (!el || !window.getComputedStyle) return;
            var cs = window.getComputedStyle(el);

            // Don’t force color; just prevent the “border-width:0 / border-style:none” trap
            if (cs.borderWidth === '0px' || cs.borderStyle === 'none') {
                el.style.setProperty('border-width', '1px', 'important');
                el.style.setProperty('border-style', 'solid', 'important');
            }
        }

        function fireInputChange(el) {
            if (!el) return;
            try { el.dispatchEvent(new Event('input', { bubbles: true })); } catch (e) { }
            try { el.dispatchEvent(new Event('change', { bubbles: true })); } catch (e2) { }
        }

        // Reset datepicker “memory” so same-date clicks are treated as new
        function hardResetInst(inputEl) {
            try {
                var inst = dp._getInst(inputEl);
                if (!inst) return;
                inst.lastVal = null;
                inst.selectedDay = inst.selectedMonth = inst.selectedYear = null;
                inst.currentDay = inst.currentMonth = inst.currentYear = null;
            } catch (e) { }
        }

        function isDatepickerBound(el) {
            try { return !!el && $(el).hasClass('hasDatepicker'); } catch (e) { return false; }
        }

        // Always write to BOTH peers; fire change only on the postback element
        function writeBothAndFire(anyEl, dateStr) {
            if (!anyEl) return;

            var peer = findPeer(anyEl);
            var pbEl = getPostbackElement(anyEl);

            // Write value into both (prevents “picker wrote to dte but txt stays blank”)
            anyEl.value = dateStr || '';
            if (peer) peer.value = dateStr || '';

            ensureBorderNotZero(anyEl);
            if (peer) ensureBorderNotZero(peer);

            // Reset internal picker memory on whichever one is bound
            if (isDatepickerBound(anyEl)) hardResetInst(anyEl);
            if (peer && isDatepickerBound(peer)) hardResetInst(peer);

            fireInputChange(pbEl);
        }

        // ==========================================================
        // 1) HARD PATCH: Core select handler (hard to overwrite)
        //    Ensures same-date selection ALWAYS writes & fires change.
        // ==========================================================
        if (!dp.__kdotSelectPatched) {
            dp.__kdotSelectPatched = true;

            var originalSelectDate = dp._selectDate;
            dp._selectDate = function (id, dateStr) {
                // Run original logic first
                var ret = originalSelectDate.call(this, id, dateStr);

                // Find the bound input
                var inst = null, bound = null;
                try {
                    inst = this._getInst($(id)[0]);
                    bound = inst && inst.input ? inst.input[0] : null;
                } catch (e) { }

                // Apply only to our IDs
                if (isTarget(bound)) {
                    // 🔑 force value write even if same date
                    writeBothAndFire(bound, dateStr);
                }

                return ret;
            };
        }

        // ==========================================================
        // 2) CLEAR FUNCTION: used by ANY X button
        //    Clears BOTH peers + resets picker memory + fires change.
        // ==========================================================
        window.clearDateInputHard = function (field) {
            if (!field) return;

            var peer = findPeer(field);
            var pbEl = getPostbackElement(field);

            // Clear values in BOTH
            field.value = '';
            if (peer) peer.value = '';

            // Clear datepicker selection where it is actually bound
            try {
                if (isDatepickerBound(field)) {
                    $(field).datepicker('setDate', null);
                    hardResetInst(field);
                }
            } catch (e) { }

            try {
                if (peer && isDatepickerBound(peer)) {
                    $(peer).datepicker('setDate', null);
                    hardResetInst(peer);
                }
            } catch (e2) { }

            ensureBorderNotZero(field);
            if (peer) ensureBorderNotZero(peer);

            fireInputChange(pbEl);
        };

        // ==========================================================
        // 3) X BUTTON WIRING (works with BOTH of your systems):
        //    - .txt-clear-btn  (data-for="id")
        //    - .final-clear-btn (data-for="id")
        // ==========================================================
        function isClearBtn(el) {
            return !!el && el.classList && (
                el.classList.contains('txt-clear-btn') ||
                el.classList.contains('final-clear-btn')
            );
        }

        // Use CAPTURE so we beat other handlers that may stopPropagation
        document.addEventListener('mousedown', function (e) {
            var t = e.target;
            var btn = t && t.closest ? t.closest('button') : null;
            if (!btn || !isClearBtn(btn)) return;

            var id = btn.getAttribute('data-for') || btn.dataset.for;
            if (!id) return;

            var field = document.getElementById(id);
            if (!field) return;

            // Only handle date ids with our hard clear. Non-date fields can keep their own logic.
            if (isTarget(field) || isTarget(findPeer(field))) {
                e.preventDefault();
                e.stopPropagation();
                window.clearDateInputHard(field);

                try { field.focus(); } catch (x) { }
            }
        }, true);

        // ==========================================================
        // 4) UpdatePanel safety: re-ensure datepicker memory won’t stick
        //    (No global onSelect overrides; core patch already handles it)
        // ==========================================================
        function afterPartial() {
            // Nothing heavy needed; but we can normalize borders on target fields
            for (var i = 0; i < DATE_IDS.length; i++) {
                var el = document.getElementById(DATE_IDS[i]);
                if (el) ensureBorderNotZero(el);
            }
        }

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(afterPartial);
        }
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', afterPartial);
        } else {
            afterPartial();
        }

    })();

    //keep alive script
    // This script is currently commented out.
    // If a timeout issue occurs in production, this code will be enabled per Julie’s guidance.
   <%-- (function () {
        // Ping interval should be < any 5-min idle/lock settings to avoid races.
        var PING_MS = 300000; // 5 minutes

        function ping() {
            // "fetch" keepalive
            fetch('<%= ResolveUrl("~/KeepAlive.ashx") %>', {
          method: 'GET',
          credentials: 'same-origin',
          cache: 'no-store'
      }).catch(function () {
          // Fallback: image ping (still sends cookies)
          var img = new Image();
          img.src = '<%= ResolveUrl("~/KeepAlive.ashx") %>?t=' + Date.now();
    });
        }

        // Start shortly after load, then repeat
        setTimeout(ping, 15000);  // 15s after load
        setInterval(ping, PING_MS);
    })();--%>


    //grdRep line height fix
    (function () {
        'use strict';

        function fixGrdRepSpacing() {
            var list = document.querySelectorAll('table[id*="grdRep"] textarea.grow-textarea.grow-singleline');
            for (var i = 0; i < list.length; i++) {
                var ta = list[i];

                // ✅ override the inline !important that your lock scripts set
                ta.style.setProperty('line-height', '18px', 'important');
                ta.style.setProperty('padding', '0 2px', 'important');
                ta.style.setProperty('margin', '0', 'important');

                // keep grow behavior working
                ta.style.setProperty('max-height', 'none', 'important');
                ta.style.setProperty('overflow', 'hidden', 'important');
                ta.style.setProperty('resize', 'none', 'important');

                // IMPORTANT: don't force 30px height on grow fields
                // let your grow script control height
                ta.style.removeProperty('height');
                ta.style.removeProperty('min-height');
                ta.style.removeProperty('max-height');

                // baseline (IE-like single line)
                ta.style.setProperty('min-height', '18px', 'important');
                ta.style.setProperty('box-sizing', 'border-box', 'important');
                ta.style.setProperty('display', 'block', 'important');
            }
        }

        function runFix() {
            fixGrdRepSpacing();
            setTimeout(fixGrdRepSpacing, 0);
            setTimeout(fixGrdRepSpacing, 50);
            setTimeout(fixGrdRepSpacing, 150);
        }

        if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', runFix);
        else runFix();

        // UpdatePanel support
        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(runFix);
        }
    })();


    //tabbing issue fix for txtMtgAdjourned
    (function () {
        function wire() {
            var tb = document.getElementById('txtMtgAdjourned');
            var ddl = document.getElementById('UCSubmit1_ReviewAction');
            var hf = document.getElementById('hfTabToReviewAction'); // static

            if (!tb || !ddl || !hf) return;
            if (tb.dataset.kdotTabWired === '1') return;
            tb.dataset.kdotTabWired = '1';

            // capture the value at focus so we can detect "changed"
            tb.addEventListener('focus', function () {
                tb.dataset.orig = tb.value || '';
            });

            tb.addEventListener('keydown', function (e) {
                if ((e.key === 'Tab' || e.keyCode === 9) && !e.shiftKey) {
                    hf.value = '1'; // tell server: tabbing out of this field

                    var orig = tb.dataset.orig || '';
                    var now = tb.value || '';

                    // If nothing changed, TextChanged won't fire -> so we must move focus ourselves
                    if (now === orig) {
                        e.preventDefault();
                        setTimeout(function () { ddl.focus(); }, 0);
                    }
                    // If changed: allow normal WebForms blur/change -> TextChanged postback will happen
                }
            }, true);
        }

        document.addEventListener('DOMContentLoaded', wire);

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(wire);
        }
    })();


    (function () {
        function applyFocusStyle(ddl) {
            ddl.style.setProperty('box-shadow', 'inset 0 0 0 2px #000', 'important');
            ddl.style.setProperty('border-bottom', '2px solid #000', 'important');
            ddl.style.setProperty('outline', 'none', 'important');
        }

        function clearFocusStyle(ddl) {
            ddl.style.removeProperty('box-shadow');
            ddl.style.removeProperty('border-bottom');
            ddl.style.removeProperty('outline');
        }

        function wireReviewActionRing() {
            var ddl = document.getElementById('UCSubmit1_ReviewAction');
            if (!ddl) return;

            // Avoid double-binding
            if (ddl.dataset.kdotRingWired === '1') {
                // If it is already focused after a postback, re-apply style
                if (document.activeElement === ddl) applyFocusStyle(ddl);
                return;
            }
            ddl.dataset.kdotRingWired = '1';

            ddl.addEventListener('focus', function () {
                applyFocusStyle(ddl);
            });

            ddl.addEventListener('blur', function () {
                clearFocusStyle(ddl);
            });

            // If focus was restored to this element after a postback, style it immediately
            if (document.activeElement === ddl) applyFocusStyle(ddl);
        }

        // initial load
        document.addEventListener('DOMContentLoaded', wireReviewActionRing);

        // BEST hook for WebForms + UpdatePanel: runs after async postback updates DOM
        if (window.Sys && Sys.Application) {
            Sys.Application.add_load(wireReviewActionRing);
        }

        // Also keep endRequest for safety
        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(wireReviewActionRing);
        }
    })();

    //kill the overflow border 
    (function () {
        function killPhantomScrollbar(root) {
            root = root || document;

            var list = root.querySelectorAll('textarea');
            list.forEach(function (ta) {
                // if any script forced a scrollbar, remove it
                var styleText = (ta.getAttribute('style') || '').toLowerCase();

                // catch "overflow: hidden scroll" or any overflow-y: scroll/auto
                var forced =
                    styleText.includes('overflow: hidden scroll') ||
                    styleText.includes('overflow-y: scroll') ||
                    styleText.includes('overflow: scroll') ||
                    getComputedStyle(ta).overflowY === 'scroll';

                if (forced) {
                    ta.style.setProperty('overflow', 'hidden', 'important');
                    ta.style.setProperty('overflowY', 'hidden', 'important');
                    ta.style.setProperty('overflowX', 'hidden', 'important');
                }
            });
        }

        document.addEventListener('DOMContentLoaded', function () {
            killPhantomScrollbar(document);
        });

        // UpdatePanel support
        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                killPhantomScrollbar(document);
            });
        }
    })();
    
    (function () {
        function restoreKdotFocus() {
            var id = null;
            try { id = sessionStorage.getItem('kdot_next_focus'); } catch (e) { }
            if (!id) return;

            var tries = 0;

            (function attempt() {
                var el = document.getElementById(id);

                // keep retrying until the element exists and is focusable
                if (el && !el.disabled) {
                    try {
                        el.focus();

                        // if focus really stuck, clear the key and stop
                        if (document.activeElement === el) {
                            try { sessionStorage.removeItem('kdot_next_focus'); } catch (e) { }
                            return;
                        }
                    } catch (e) { }
                }

                if (++tries < 40) {
                    setTimeout(attempt, 100);
                }
            })();
        }

        // Full page load
        window.addEventListener('load', function () {
            setTimeout(restoreKdotFocus, 0);
            setTimeout(restoreKdotFocus, 150);
            setTimeout(restoreKdotFocus, 400);
            setTimeout(restoreKdotFocus, 800);
        });

        // UpdatePanel partial postback
        if (window.Sys && Sys.Application) {
            Sys.Application.add_load(function () {
                setTimeout(restoreKdotFocus, 0);
                setTimeout(restoreKdotFocus, 150);
                setTimeout(restoreKdotFocus, 400);
                setTimeout(restoreKdotFocus, 800);
            });
        }

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                setTimeout(restoreKdotFocus, 0);
                setTimeout(restoreKdotFocus, 150);
                setTimeout(restoreKdotFocus, 400);
                setTimeout(restoreKdotFocus, 800);
            });
        }
    })();


</script>
</html>
