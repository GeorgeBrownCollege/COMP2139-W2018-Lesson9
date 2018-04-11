<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="COMP2139_W2018_Lesson9.Students" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-offset-2 col-md-8">

            <h1>Student List</h1>
            <a href="/Contoso/StudentDetails.aspx" class="btn btn-success btn-sm">
                <i class="fa fa-plus"> Add Student</i>
            </a>

            <asp:GridView ID="StudentGridView" runat="server" AutoGenerateColumns="false"
                CssClass="table table-bordered table-striped table-hover" DataKeyNames="StudentID"
                OnRowDeleting="StudentGridView_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="Student ID" Visible="true" SortExpression="StudentID" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" Visible="true" SortExpression="LastName" />
                    <asp:BoundField DataField="FirstMidName" HeaderText="First Name" Visible="true" SortExpression="FirstMidName" />
                    <asp:BoundField DataField="EnrollmentDate" HeaderText="Enrollment Date" Visible="true" DataFormatString="{0:MMM dd, yyyy}" SortExpression="EnrollmentDate" />

                    <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit"
                        NavigateUrl="StudentDetails.aspx" ControlStyle-CssClass="btn btn-primary btn-sm"
                        runat="server" DataNavigateUrlFields="StudentID"
                        DataNavigateUrlFormatString="/Contoso/StudentDetails.aspx?StudentID={0}" />

                    <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete"
                        ShowDeleteButton="true" ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm" />
                </Columns>

            </asp:GridView>
        </div>
    </div>
</asp:Content>
