<%@ Page Language="c#" MasterPageFile="../masterpages/umbracoDialog.Master" AutoEventWireup="True" Inherits="umbraco.presentation.dialogs.rollBack" %>

<%@ Register TagPrefix="cc1" Namespace="umbraco.uicontrols" Assembly="controls" %>
<%@ Register TagPrefix="umb" Namespace="ClientDependency.Core.Controls" Assembly="ClientDependency.Core" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function doSubmit() { document.Form1["ok"].click() }

        var functionsFrame = this;
        var tabFrame = this;
        var isDialog = true;
        var submitOnEnter = true;
    </script>

</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <div class="umb-dialog-body">
        <umb:JsInclude ID="JsInclude1" runat="server" FilePath="js/umbracoCheckKeys.js" PathNameAlias="UmbracoRoot" />

        <cc1:Feedback ID="feedBackMsg" runat="server" />

        <cc1:Pane ID="pp_selectVersion" runat="server" Text="Select a version to compare with the current version">
            <cc1:PropertyPanel id="pp_currentVersion" Text="Current version" runat="server">
                <asp:Literal ID="currentVersionTitle" runat="server" />
                <small>(<asp:Literal ID="currentVersionMeta" runat="server" />)</small></cc1:PropertyPanel>
            <cc1:PropertyPanel ID="pp_rollBackTo" Text="Rollback to" runat="server">
                <asp:DropDownList OnSelectedIndexChanged="version_load" ID="allVersions" runat="server" AutoPostBack="True" CssClass="guiInputTextTiny diffDropdown" />
            </cc1:PropertyPanel>

            <cc1:PropertyPanel id="pp_view" Text="View" runat="server">
                <small>
                    <asp:RadioButtonList ID="rbl_mode" runat="server" OnSelectedIndexChanged="version_load" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="diff">Diff</asp:ListItem>
                        <asp:ListItem Value="html">Html</asp:ListItem>
                    </asp:RadioButtonList>
                </small>
            </cc1:PropertyPanel>
        </cc1:Pane>

        <asp:Panel ID="diffPanel" Visible="false" runat="server" CssClass="diffPanel">
            <div class="diff">
                <div class="diffnotice">
                    <p>
                        <asp:Literal ID="lt_notice" runat="server" />
                    </p>
                </div>

                <table>
                    <asp:Literal ID="propertiesCompare" runat="server"></asp:Literal>
                </table>
            </div>
        </asp:Panel>
    </div>

    <div runat="server" id="pl_buttons" class="umb-dialog-footer btn-toolbar umb-btn-toolbar">
        <a href="#" class="btn btn-link" onclick="UmbClientMgr.closeModalWindow()"><%=umbraco.ui.Text("general", "close")%></a>
        <asp:Button ID="Button1" runat="server" visible="false" CssClass="btn btn-primary" OnClick="doRollback_Click"></asp:Button>
    </div>  
</asp:Content>
