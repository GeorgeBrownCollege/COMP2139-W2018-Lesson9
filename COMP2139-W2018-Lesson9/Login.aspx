<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="COMP2139_W2018_Lesson9.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="row">
        <div class="col-md-offset-4 col-md-4">
            <div id="AlertFlash" class="alert alert-danger" runat="server" visible="false">
                <asp:label runat="server" ID="StatusLabel"></asp:label>

            </div>
            <br />
            <h1>Login Page</h1>
            <div class="card ">
                <div class="card-heading text-white bg-primary">
                    <h1 class="card-title"><i class="fa fa-sign-in fa-lg"></i> Login</h1>
                </div>
                <br />
                <div class="card-body">
                    <div class="form-group">
                        <label class="control-label" for="UserNameTextBox">Username:</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="UserNameTextBox" placeholder="Username" required="true" TabIndex="0"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="PasswordTextBox">Password:</label>
                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="PasswordTextBox" placeholder="Password" required="true" TabIndex="0"></asp:TextBox>
                    </div>

                    <div class="text-right">
                        <asp:Button Text="Login" ID="LoginButton" runat="server" CssClass="btn btn-primary" TabIndex="0" OnClick="LoginButton_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
