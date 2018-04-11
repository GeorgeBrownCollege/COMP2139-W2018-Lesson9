using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// using statements that are required to connect to EF DB
using COMP2139_W2018_Lesson9.Models;
using System.Web.ModelBinding;
using System.Linq.Expressions;

namespace COMP2139_W2018_Lesson9
{
    public partial class Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if loading the page for the first time
            // populate the Student Grid
            if(!IsPostBack)
            {
                // Get Student Information from DB
                GetStudents();
            }
            
        }

        private void GetStudents()
        {
            // connect to EF DB
            using (ContosoModel db = new ContosoModel())
            {
                // query the Student Table using EF and LINQ
                var Students = (from allStudents in db.Students
                                select allStudents);

                // bind the result to the StudentGridView
                StudentGridView.DataSource = Students.ToList();
                StudentGridView.DataBind();
            }
        }

        protected void StudentGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // store which row was clicked
            int selectedRow = e.RowIndex;

            // get the selected StudentID using the Grid's DataKey collection
            int StudentID = Convert.ToInt32(StudentGridView.DataKeys[selectedRow].Values["StudentID"]);


            // use EF to connect to the db
            using (ContosoModel db = new ContosoModel())
            {
                Student deletedStudent = (from studentRecords in db.Students
                                          where studentRecords.StudentID == StudentID
                                          select studentRecords).FirstOrDefault();

                // remove the selected student
                db.Students.Remove(deletedStudent);


                // save changes
                db.SaveChanges();

                this.GetStudents();
            }
        }
    }
}