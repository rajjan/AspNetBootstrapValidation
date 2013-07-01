<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BootstrapValidation.Account.Login" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link href="bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery.validate.js" type="text/javascript"></script>
    <script>
        $(function () {
            $("#form1").validate({
                onsubmit: false,
                highlight: function (element) {
                    $(element).closest('.control-group').removeClass('success').addClass('error');
                },
                success: function (element) {
                    element.closest('.control-group').removeClass('error').addClass('success');
                },
            });
            $("[id$=_UserName]").rules("add", { required: true, maxlength: 200, });
            $("[id$=_Password]").rules("add", { required: true, maxlength: 5000 });
        });

        function ValidateInput() {
            var isValid = $("#form1").valid();
            /*
            add additional control checks here...
            */
            return isValid;
        }
    </script>
    <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>
    <section id="loginForm">        
        <asp:Login runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
            <LayoutTemplate>
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                <fieldset>
                    <legend>Log in Form</legend>
                    <ol>
                        <li>
                            <div class="control-group">
                                <label>User Name</label>
                                <asp:TextBox runat="server" ID="UserName" CssClass="input-xlarge" />
                            </div>
                        </li>
                        <li>
                            <div class="control-group">
                                <label>Password</label>
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                            </div>
                        </li>
                    </ol>
                    <asp:Button runat="server" CommandName="Login" Text="Log in" OnClientClick="return ValidateInput()" />
                </fieldset>
            </LayoutTemplate>
        </asp:Login>
    </section>

</asp:Content>
