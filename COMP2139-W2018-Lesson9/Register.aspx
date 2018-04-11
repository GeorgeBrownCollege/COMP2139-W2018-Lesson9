<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="COMP2139_W2018_Lesson9.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-offset-4 col-md-4">
            <div id="AlertFlash" class="alert alert-danger" runat="server" visible="false">
                <asp:Label runat="server" ID="StatusLable"></asp:Label>
            </div>

            <h1>Registration Page</h1>
            <h5>All Fields are Required</h5>
            <br />
            <div class="card">
                <div class="card-heading bg-primary text-white">
                    <h1 class="card-title"><i class="fa fa-user-plus fa-lg"></i> Register</h1>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label class="control-label" for="UserNameTextBox">Username:</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="UserNameTextBox" placeholder="Username" required="true" TabIndex="0"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="PhoneNumberTextBox">Phone Number:</label>
                        <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="PhoneNumberTextBox" placeholder="Phone Number" required="true" TabIndex="0"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="EmailTextBox">Email:</label>
                        <asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ID="EmailTextBox" placeholder="Email" required="true" TabIndex="0"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="PasswordTextBox">Password:</label>
                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="PasswordTextBox" placeholder="Password" required="true" TabIndex="0"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="ConfirmPasswordTextBox">Confirm Password:</label>
                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="ConfirmPasswordTextBox" placeholder="Confirm Password" required="true" TabIndex="0"></asp:TextBox>
                        <asp:CompareValidator ErrorMessage="Your Passwords Must Match" Type="String" Operator="Equal" ControlToValidate="ConfirmPasswordTextBox" runat="server"
                            ControlToCompare="PasswordTextBox" CssClass="label label-danger" />
                    </div>

                    <div class="text-right">
                         <asp:Button Text="Cancel" ID="CancelButton" runat="server" CssClass="btn btn-warning" TabIndex="0" OnClick="CancelButton_Click" UseSubmitBehavior="false"  />
                         <asp:Button Text="Register" ID="RegisterButton" runat="server" CssClass="btn btn-primary" TabIndex="0" OnClick="RegisterButton_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
